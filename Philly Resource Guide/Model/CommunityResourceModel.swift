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
    var label: String?
    var url: String?
    var descriptionNotes: String?
    var tags: [String]?
    var type: FieldsType?
    var imageURL: String?
    var phoneContact: String?
    var hoursOfOperation: String?
    var emergencyAssistanceNumber: String?
    var logo: [Logo]?
    var phoneContact2, street1, street2, email: String?
    var city, state, zip: String?

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case url = "URL"
        case descriptionNotes = "Description / Notes"
        case tags = "Tags"
        case type = "Type"
        case imageURL = "ImageURL"
        case phoneContact = "Phone Contact"
        case hoursOfOperation = "Hours of Operation"
        case emergencyAssistanceNumber = "Emergency Assistance Number"
        case logo = "Logo"
        case phoneContact2 = "Phone Contact 2"
        case street1 = "Street 1"
        case street2 = "Street 2"
        case email = "Email"
        case city = "City"
        case state = "State"
        case zip = "Zip"
    }
}

// MARK: - Logo
struct Logo: Decodable {
    var id: String?
    var width, height: Int?
    var url: String?
    var filename: String?
    var size: Int?
    var type: TypeEnum?
    var thumbnails: Thumbnails?
}

// MARK: - Thumbnails
struct Thumbnails: Decodable {
    var small, large, full: Full?
}

// MARK: - Full
struct Full: Decodable {
    var url: String?
    var width, height: Int?
}

enum TypeEnum: String, Decodable {
    case imageGIF = "image/gif"
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case imageSVGXML = "image/svg+xml"
}

enum FieldsType: String, Decodable {
    case organization = "Organization"
    case program = "Program"
}
