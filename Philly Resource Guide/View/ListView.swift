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
        NavigationStack {
            List {ForEach(viewModel.filteredResources.sorted(by: {$0.fields.label < $1.fields.label }), id: \.id) { apiData in
                NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                    TileView(label: apiData.fields.label , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
                }
            }
            }
            .listStyle(.inset)
            .navigationTitle("Philly Resource Guide")
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Philly Resource Guide")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                }
//            }
            .searchable(text: $viewModel.searchText, placement: .automatic, prompt: "Search Resources")
            .overlay {
                if viewModel.filteredResources.isEmpty {
                    ContentUnavailableView.search(text: viewModel.searchText)
                }
            }
            .refreshable {
                viewModel.getResources()
            }
        }
    }
}

#Preview {
    ListView()
}
