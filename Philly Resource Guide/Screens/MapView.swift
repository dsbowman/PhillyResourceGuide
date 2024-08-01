//
//  MapView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var addressString = "1600 Pennsylvania Ave, Washington D.C."
    @StateObject private var viewModel = MapViewModel()
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Default location
        span: MKCoordinateSpan(latitudeDelta: 0.5,
                               longitudeDelta: 0.5)
    )
    
    var body: some View {
        VStack {
            Map {
                ForEach(viewModel.resources) { record in
                    if let coordinate = record.fields.locationCoordinate {
                        Annotation(record.fields.label, coordinate: coordinate) {
                            Circle()
                                .fill(.blue)
                                .frame(width: 10, height: 10)
                        }
                    }
                }

            }
            .searchable(text: $viewModel.searchText)
//            .sheet(isPresented: $viewModel.isSheetPresented) {
//                
//                ScrollView {
//                    LazyVGrid(columns: viewModel.columns, spacing: 40) {ForEach(viewModel.filteredResources.sorted(by: {$0.fields.label < $1.fields.label }), id: \.id) { apiData in
//                        NavigationLink(destination: DetailView(apiData: apiData.fields)) {
//                            largeTile(label: apiData.fields.label , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
//                                .accentColor(.primary)
//                        }
//                        
//                    }
//                    }
//                    .listStyle(.plain)
//                    .task { viewModel.getResources() }
//                    .refreshable { viewModel.getResources() }
//                }
//                DetailView(apiData: )
//                .presentationDragIndicator(.visible)
//                .presentationDetents([.height(250), .medium, .large])
//                .navigationBarTitleDisplayMode(.inline)
//            }
            
            
            if viewModel.isLoading {
                LoadingView()
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

