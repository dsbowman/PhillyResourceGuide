//
//  ListViewModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/29/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var networkManager = NetworkManager()
    @Published var resources: [Record] = []
    @Published var searchText: String = ""
    
    var filteredResources: [Record] {
        guard !searchText.isEmpty else {return resources}
        
        return resources.filter { resource in
            resource.fields.label.localizedCaseInsensitiveContains(searchText) || resource.fields.descriptionNotes?.localizedCaseInsensitiveContains(searchText) ?? false || resource.fields.tags?.debugDescription.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    
    init() {
        self.getResources()
    }
    
    func getResources() {
        networkManager.getData { resourcesFromData in DispatchQueue.main.async {
            self.resources = resourcesFromData
            }
        }
    }

}
