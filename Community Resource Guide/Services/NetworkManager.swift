//
//  NetworkManager.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/9/24.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var apiData = [Record]()
    @Published var searchText = ""
    
    var filteredResources: [Record] {
        guard !searchText.isEmpty else { return apiData }
        return apiData.filter { $0.fields.label?.localizedCaseInsensitiveContains(searchText) ?? false || $0.fields.descriptionNotes?.localizedCaseInsensitiveContains(searchText) ?? false || $0.fields.tags?.debugDescription.localizedCaseInsensitiveContains(searchText) ?? false}
            
        }

    
    func getData() {
        var request = URLRequest(url: URL(string: "https://api.airtable.com/v0/appG874fGad8U9K7y/CommunityResources")!,timeoutInterval: Double.infinity)
        request.addValue("Bearer pat9oBQHMYP0D8ZqG.6a33616f8677ee3534fc7c6e45dced6f1b3f42690446b31abcaff961c852ce6f", forHTTPHeaderField: "Authorization")
        request.addValue("brw=brw6K1tIMcG4mJEmB; AWSALB=UuMmtQu6qcyp7cirtXcQTsK/IM93SmTUFe+rMT5dP6W83UKGxH2kJYDjHt5DjR/QWuc9ADzw55CVl7iSLtaA3cgYRTmvoNtWCA0G9xQ9vZUTJ8z94XV9qnrNy2Fb; AWSALBCORS=UuMmtQu6qcyp7cirtXcQTsK/IM93SmTUFe+rMT5dP6W83UKGxH2kJYDjHt5DjR/QWuc9ADzw55CVl7iSLtaA3cgYRTmvoNtWCA0G9xQ9vZUTJ8z94XV9qnrNy2Fb", forHTTPHeaderField: "Cookie")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let resourseData = try JSONDecoder().decode(CommunityResourceModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.apiData = resourseData.records
                }
                
            } catch {
                print("Error parsing JSON: \(error)")
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("JSON String: \(jsonString)")
//                }
            }
        }
        
        task.resume()
        
    }
    
}
