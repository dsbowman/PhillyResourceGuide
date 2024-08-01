//
//  ListViewModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/29/24.
//

import SwiftUI

@MainActor class ListViewModel: ObservableObject {
    
    @Published var resources: [Record] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = true
    @Published var searchText: String = ""
    @Published var isShowingList = true
    
    var filteredResources: [Record] {
        guard !searchText.isEmpty else {return resources}
        
        return resources.filter { resource in
            resource.fields.label.localizedCaseInsensitiveContains(searchText) || resource.fields.descriptionNotes?.localizedCaseInsensitiveContains(searchText) ?? false || resource.fields.tags?.debugDescription.localizedCaseInsensitiveContains(searchText) ?? false
        }
    }
    
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 350))]
    
    func getResources() {
        isLoading = true
        Task {
            do {
                resources = try await NetworkManager.shared.getData()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                    
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }

}
