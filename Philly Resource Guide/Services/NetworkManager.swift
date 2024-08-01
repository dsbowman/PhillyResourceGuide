//
//  NetworkManager.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/9/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://api.airtable.com/v0/appG874fGad8U9K7y/CommunityResources"
    private let authorizationToken = "Bearer pat9oBQHMYP0D8ZqG.6a33616f8677ee3534fc7c6e45dced6f1b3f42690446b31abcaff961c852ce6f"
    
    private init() {}
    
    func getData() async throws -> [Record] {
        guard let url = URL(string: baseURL) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url) // Create a mutable request
        request.setValue(authorizationToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status Code: \(httpResponse.statusCode)")
            //            if let headers = httpResponse.allHeaderFields as? [String: String] {
            //                print("Headers: \(headers)")
            //            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APError.invalidResponse // Or a more specific error based on the response
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CommunityResourceModel.self, from: data).records
        } catch {
            throw APError.invalidURL // Provide the underlying decoding error
        }
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
    
//    func getData() async throws -> [Record] {
//            guard let url = URL(string: baseURL) else {
//                throw APError.invalidURL
//            }
//        
//        //            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//        //            request.addValue(authorizationToken, forHTTPHeaderField: "Authorization")
//        //            // Add other necessary headers if needed
//        //
//        //            request.httpMethod = "GET"
//        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        
//        
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(CommunityResourceModel.self, from: data).records
//        } catch {
//            throw APError.invalidURL
//        }
//
////            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
////            request.addValue(authorizationToken, forHTTPHeaderField: "Authorization")
//            // Add other necessary headers if needed
//        }
    
    
    
//    func getData(completion: @escaping ([Record]) -> Void) {
//            guard let url = URL(string: baseURL) else {
//                print("Invalid URL")
//                return
//            }
//
//            var request = URLRequest(url: url, timeoutInterval: Double.infinity)
//            request.addValue(authorizationToken, forHTTPHeaderField: "Authorization")
//            // Add other necessary headers if needed
//
//            request.httpMethod = "GET"
//
//            let task = URLSession.shared.dataTask(with: request) { data, _, error in
//                if let error = error {
//                    print("Error fetching data: \(error)")
//                    return
//                }
//
//                if let data = data {
////                    print(String(data: data, encoding: .utf8)!)
//                    do {
//                        let resourceData = try JSONDecoder().decode(CommunityResourceModel.self, from: data)
//                        completion(resourceData.records)
//                    } catch {
//                        print("Error parsing JSON: \(error)")
//                    }
//                }
//            }
//            task.resume()
//        }

