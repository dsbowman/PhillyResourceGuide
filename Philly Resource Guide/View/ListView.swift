//
//  ListView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var networkManager = NetworkManager()

    
    var body: some View {
        NavigationView {
            List {ForEach(networkManager.filteredResources.sorted(by: {$0.fields.label ?? "" < $1.fields.label ?? ""}), id: \.id) { apiData in
                NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                    TileView(label: apiData.fields.label! , imageUrl: apiData.fields.logo?.first?.url ?? "", description: apiData.fields.descriptionNotes ?? "")
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
            .searchable(text: $networkManager.searchText, placement: .automatic)
            .refreshable {
                self.networkManager.getData()
            }
        }
        
        .onAppear(perform: self.networkManager.getData)
    }
}

#Preview {
    ListView()
}
