//
//  DataModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/8/24.
//


import Foundation
import SwiftUI
import MapKit

// MARK: - CommunityResourceModel
struct CommunityResourceModel: Decodable  {
    var records: [Record]
}

// MARK: - Record
struct Record: Decodable, Identifiable {
    var id: String
    var createdTime: String?
    var fields: Fields
}

// MARK: - Fields
struct Fields: Decodable {
    var descriptionNotes: String?
    var url: String?
    var imageURL: String?
    var tags: [String]?
    var logo: [Logo]?
    var type: FieldsType?
    var label: String
    var hoursOfOperation, phoneContact, emergencyAssistanceNumber: String?
    var phoneContact2, street1, street2, email: String?
    var state, zip, city: String?
    var location: String?
    var locationCoordinate: CLLocationCoordinate2D?

    enum CodingKeys: String, CodingKey {
        case descriptionNotes = "Description / Notes"
        case url = "URL"
        case imageURL = "ImageURL"
        case tags = "Tags"
        case logo = "Logo"
        case type = "Type"
        case label = "Label"
        case hoursOfOperation = "Hours of Operation"
        case phoneContact = "Phone Contact"
        case emergencyAssistanceNumber = "Emergency Assistance Number"
        case phoneContact2 = "Phone Contact 2"
        case street1 = "Street 1"
        case street2 = "Street 2"
        case email = "Email"
        case state = "State"
        case zip = "Zip"
        case city = "City"
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
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case imageSVGXML = "image/svg+xml"
}

enum FieldsType: String, Decodable {
    case organization = "Organization"
    case program = "Program"
}



//// MARK: - Welcome
//struct CommunityResourceModel: Decodable {
//    var resources: [Resources]
//}
//
//// MARK: - Record
//struct Resources: Decodable, Identifiable {
//    var id: String
//    var fields: Fields
//}
//
//// MARK: - Fields
//struct Fields: Decodable {
//    var label: String?
//    var url: String?
//    var descriptionNotes: String?
//    var tags: [String]?
//    var type: FieldsType?
//    var imageURL: String?
//    var phoneContact: String?
//    var hoursOfOperation: String?
//    var emergencyAssistanceNumber: String?
//    var logo: [Logo]?
//    var phoneContact2, street1, street2, email: String?
//    var city, state, zip: String?
//
//    enum CodingKeys: String, CodingKey {
//        case label = "Label"
//        case url = "URL"
//        case descriptionNotes = "Description / Notes"
//        case tags = "Tags"
//        case type = "Type"
//        case imageURL = "ImageURL"
//        case phoneContact = "Phone Contact"
//        case hoursOfOperation = "Hours of Operation"
//        case emergencyAssistanceNumber = "Emergency Assistance Number"
//        case logo = "Logo"
//        case phoneContact2 = "Phone Contact 2"
//        case street1 = "Street 1"
//        case street2 = "Street 2"
//        case email = "Email"
//        case city = "City"
//        case state = "State"
//        case zip = "Zip"
//    }
//}
//
//// MARK: - Logo
//struct Logo: Decodable {
//    var id: String?
//    var width, height: Int?
//    var url: String?
//    var filename: String?
//    var size: Int?
//    var type: TypeEnum?
//    var thumbnails: Thumbnails?
//}
//
//// MARK: - Thumbnails
//struct Thumbnails: Decodable {
//    var small, large, full: Full?
//}
//
//// MARK: - Full
//struct Full: Decodable {
//    var url: String?
//    var width, height: Int?
//}
//
//enum TypeEnum: String, Decodable {
//    case imageGIF = "image/gif"
//    case imageJPEG = "image/jpeg"
//    case imagePNG = "image/png"
//    case imageSVGXML = "image/svg+xml"
//}
//
//enum FieldsType: String, Decodable {
//    case organization = "Organization"
//    case program = "Program"
//}
