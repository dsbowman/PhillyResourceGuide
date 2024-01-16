//
//  DataModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/8/24.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import SwiftUI

// MARK: - Welcome
struct CommunityResourceModel: Decodable {
    var records: [Record]
}

// MARK: - Record
struct Record: Decodable, Identifiable {
    var id: String
    var fields: Fields
}

// MARK: - Fields
struct Fields: Decodable {
    var label: String
    var url: String?
    var descriptionNotes: String?
    var tags: [String]?
    var type: FieldsType?
    var phoneContact, hoursOfOperation, emergencyAssistanceNumber: String?
    var imageURL: String?
    var phoneContact2, location, email: String?

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case url = "URL"
        case descriptionNotes = "Description / Notes"
        case tags = "Tags"
        case type = "Type"
        case phoneContact = "Phone Contact"
        case hoursOfOperation = "Hours of Operation"
        case emergencyAssistanceNumber = "Emergency Assistance Number"
        case imageURL = "ImageURL"
        case phoneContact2 = "Phone Contact 2"
        case location = "Location"
        case email = "Email"
    }
}

enum FieldsType: String, Decodable {
    case organization = "Organization"
    case program = "Program"
}
