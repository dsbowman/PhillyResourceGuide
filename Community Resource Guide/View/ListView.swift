//
//  ListView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/5/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .center) {
        
            NavigationView {
                List {ForEach(networkManager.apiData, id: \.id) { apiData in
                    NavigationLink(destination: DetailView()) {
                        TileView(label: apiData.fields.label , imageUrl: apiData.fields.imageURL ?? "", description: apiData.fields.descriptionNotes ?? "")
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
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                           
                    .onAppear(perform: self.networkManager.getData)
                           }
                           }
                           }
                           
                           
                           #Preview {
                    ListView()
                }
