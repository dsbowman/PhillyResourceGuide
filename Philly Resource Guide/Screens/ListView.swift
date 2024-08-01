//
//  ListView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {ForEach(viewModel.filteredResources.sorted(by: {$0.fields.label < $1.fields.label }), id: \.id) { apiData in
                    NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                        ListItem(label: apiData.fields.label , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
                    }
                    
                }
                }
                .listStyle(.plain)
                
                .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Resources")
                .overlay {
                    if viewModel.filteredResources.isEmpty && viewModel.isLoading {
                        LoadingView()
                    } else if viewModel.filteredResources.isEmpty {
                        ContentUnavailableView.search(text: viewModel.searchText)
                    }
                }
                .task { viewModel.getResources() }
                .refreshable { viewModel.getResources() }
                
            }
            .navigationTitle("Philly Resources")
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                 message: alertItem.message,
                 dismissButton: alertItem.dismissButton)
        
            
        }
    }
   
}

#Preview {
    ListView()
}
