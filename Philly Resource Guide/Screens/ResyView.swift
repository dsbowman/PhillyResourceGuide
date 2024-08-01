//
//  ResyView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 7/25/24.
//

import SwiftUI

struct ResyView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    
    var body: some View {
        
        ZStack {
            

        }
        .sheet(isPresented: $viewModel.isShowingList) {
            ZStack {
                
                VStack {
                    TileSheetView()
                        
                }
                .presentationDragIndicator(.visible)
            }
            
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Resources")
        
    }
}



#Preview {
    ResyView()
}



struct TileSheetView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns, spacing: 40) {ForEach(viewModel.filteredResources.sorted(by: {$0.fields.label < $1.fields.label }), id: \.id) { apiData in
                    NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                        largeTile(label: apiData.fields.label , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
                            .accentColor(.primary)
                    }
                    
                }
                }
                .listStyle(.plain)
                .task { viewModel.getResources() }
                .refreshable { viewModel.getResources() }
            }
        }
    }
}
