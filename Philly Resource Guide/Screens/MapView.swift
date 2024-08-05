//
//  MapView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = ListViewModel()
    @State private var settingsDetent = PresentationDetent.height(225)

    
    var body: some View {
        VStack {
            Map {
                ForEach(viewModel.resources) { record in
                    if let coordinate = record.fields.locationCoordinate {
                        Annotation(record.fields.label, coordinate: coordinate) {
                            Circle()
                                .fill(.teal)
                                .frame(width: 10, height: 10)
                                .onTapGesture {
                                    viewModel.selectedResource = record.fields
                                    viewModel.isShowingDetail = true
                                        
                                }
                                .frame(width: 30, height: 30)
                        }
                     
                    }
                }

            }
            .searchable(text: $viewModel.searchText)
            .sheet(isPresented: $viewModel.isShowingDetail) {
                DetailView(apiData: viewModel.selectedResource ?? MockData.sampleResource)
                    .presentationDetents([.height(225), .medium, .large], selection: $settingsDetent)
                    .presentationDragIndicator(.visible)
            }
            
        }
        .task {
            viewModel.getResources()
            viewModel.fetchCoordinates()
        }
    }
}


#Preview {
    MapView()
}

