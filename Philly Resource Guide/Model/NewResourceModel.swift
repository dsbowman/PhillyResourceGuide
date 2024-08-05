//
//  NewResource.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 8/2/24.
//

import Foundation

struct NewResourceModel: Codable {
    var label = ""
    var descriptionNotes = ""
    var url = ""
    var imageURL = ""
    var tags = [""]
    var hoursOfOperation = ""
    var phoneContact = ""
    var emergencyAssistanceNumber = ""
    var phoneContact2 = ""
    var street1 = ""
    var street2 = ""
    var email = ""
    var state = ""
    var zip = ""
    var city = ""
}
