//
//  DetailView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/10/24.
//

import SwiftUI
import MapKit
import WebKit

struct DetailView: View {
    
    var apiData: Fields
    
    var body: some View {
        TileView(label: apiData.label!, imageUrl: apiData.imageURL ?? "")
        List {
            if let description = apiData.descriptionNotes {
                Section {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                        Text(description)
                        
                    }
                }
            }
            if let hoursOfOperation = apiData.hoursOfOperation {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hours of Operation")
                            .font(.caption)
                        Text(hoursOfOperation)
                    }
                }
            }
//            if let phoneContact = apiData.phoneContact, let phoneContact2 = apiData.phoneContact2, let email = apiData.email, let url = apiData.url {
                Section {
                    if let phoneContact = apiData.phoneContact {
                        ContactControl.phone(data: phoneContact) }
                    if let phoneContact2 = apiData.phoneContact2 {
                        ContactControl.phone(data: phoneContact2) }
                    if let email = apiData.email {
                        ContactControl.email(data: email) }
                    if let url = apiData.url {
                        ContactControl.website(url: url) }
                }
                if let street1 = apiData.street1, let city = apiData.city, let state = apiData.state, let zip = apiData.zip {
                    Section {
                        Link(destination: URL(string: "http://maps.apple.com/?address=\(street1),\(city),\(state)")!, label: {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text("Location")
                                        .font(.caption)
                                    Text(street1)
                                    if let street2 = apiData.street2 {
                                        Text(street2)
                                    }
                                    Text("\(city), \(state) \(zip)")
                                }
//                                Spacer()
//                                Map {
//                                    Annotation(apiData.label, location: location )
//                                }
//                                    .frame(width: 100, height: 100)
                            }
                        })
                    }
                }
            }
        }
    }




    //#Preview {
    //    DetailView(apiData: <#Fields#>)
    //}

//struct Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleDetail = DetailView(
//            label: "Order #123",
//            imageUrl: "",
//            description: "1234",
//            hoursOfOperation: "John Doe",
//            phoneContact: "Sample sales order description",
//            phoneContact2: "140.00",
//            email: "John Doe",
//            url: "Draft",
//            street1: "street1",
//            street2: "street2",
//            city: "city",
//            state: "state",
//            zip: "zip"
//            // ... other property values
//        )
//        
//        return DetailView(apiData: sampleDetail)
//    }
//}



    
