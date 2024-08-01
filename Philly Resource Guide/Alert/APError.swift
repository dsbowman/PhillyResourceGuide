//
//  Error.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 7/12/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
