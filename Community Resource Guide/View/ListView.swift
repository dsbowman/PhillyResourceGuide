//
//  ListView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var networkManager = NetworkManager()

    
    var body: some View {
        
        NavigationView {
            List {ForEach(networkManager.filteredResources.sorted(by: {$0.fields.label ?? "" < $1.fields.label ?? ""}), id: \.id) { apiData in
                NavigationLink(destination: DetailView(apiData: apiData.fields)) {
                    TileView(label: apiData.fields.label! , imageUrl: apiData.fields.imageURL ?? "", description: apiData.fields.descriptionNotes ?? "")
                }
            }
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Philadelphia Resource Guide")
                        .font(.headline)
                    
                    
                }
                
            }
            .refreshable {
                self.networkManager.getData()
            }
        }
        .searchable(text: $networkManager.searchText, placement: .navigationBarDrawer(displayMode: .always))
        
        .onAppear(perform: self.networkManager.getData)
    }
}

#Preview {
    ListView()
}
