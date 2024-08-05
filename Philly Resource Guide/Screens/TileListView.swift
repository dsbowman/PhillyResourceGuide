//
//  TileListView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 7/13/24.
//

import SwiftUI

struct TileListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns, spacing: 40) {ForEach(viewModel.filteredResources.sorted(by: {$0.fields.label < $1.fields.label }), id: \.id) { apiData in
//                        NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                        largeTile(label: apiData.fields.label , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
                                .accentColor(.primary)
                                .onTapGesture {
                                    viewModel.selectedResource = apiData.fields
                                    viewModel.isShowingDetail = true
                                }
                        }
                        
//                    }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Philly Resources")
                    .toolbar {
                        ToolbarItem {
                            Button {
                                viewModel.newResource = true
                            } label: {
                                Image(systemName: "plus.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.semibold)
                                    .tint(.teal)
                            }
                        }
                    }
                    .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Resources")
                    .task { viewModel.getResources() }
                    .refreshable { viewModel.getResources() }
                }
                
                
            }
            
        }
        .overlay {
            if viewModel.filteredResources.isEmpty && viewModel.isLoading {
                LoadingView()
            } else if viewModel.filteredResources.isEmpty {
                ContentUnavailableView.search(text: viewModel.searchText)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                 message: alertItem.message,
                 dismissButton: alertItem.dismissButton)
            
        }
        .sheet(isPresented: $viewModel.isShowingDetail) {
            DetailView(apiData: viewModel.selectedResource ?? MockData.sampleResource)
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $viewModel.newResource) {
            NewResource(newResource: $viewModel.newResource)
                .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    TileListView()
}
