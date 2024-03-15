//
//  NetworkManager.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/9/24.
//

import Foundation



class NetworkManager {
    
    private let baseURL = "https://api.airtable.com/v0/appG874fGad8U9K7y/CommunityResources"
    private let authorizationToken = "Bearer pat9oBQHMYP0D8ZqG.6a33616f8677ee3534fc7c6e45dced6f1b3f42690446b31abcaff961c852ce6f"

    
    func getData(completion: @escaping ([Record]) -> Void) {
            guard let url = URL(string: baseURL) else {
                print("Invalid URL")
                return
            }

            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            request.addValue(authorizationToken, forHTTPHeaderField: "Authorization")
            // Add other necessary headers if needed

            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }

                if let data = data {
//                    print(String(data: data, encoding: .utf8)!)
                    do {
                        let resourceData = try JSONDecoder().decode(CommunityResourceModel.self, from: data)
                        completion(resourceData.records)
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            task.resume()
        }
}
