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
                    Text(description)
                    
                } header: {
                    Text("Description")
                }
            }
            if let hoursOfOperation = apiData.hoursOfOperation {
                Section {
                    Text(hoursOfOperation)
                } header: {
                    Text("Hours of Operation")
                }
            }
//            if let phoneContact = apiData.phoneContact, let phoneContact2 = apiData.phoneContact2, let email = apiData.email, let url = apiData.url {
                Section {
                    ContactControl.phone(data: apiData.phoneContact ?? "")
                    ContactControl.phone(data: apiData.phoneContact2 ?? "")
                    ContactControl.email(data: apiData.email ?? "")
                    ContactControl.website(url: apiData.url ?? "")
                } header: {
                    Text("Contact")
                }
                if let street1 = apiData.street1, let city = apiData.city, let state = apiData.state, let zip = apiData.zip {
                    Section {
                        Link(destination: URL(string: "http://maps.apple.com/?address=\(street1),\(city),\(state)")!, label: {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text(street1)
                                        .padding(.bottom, -5)
                                    Text(apiData.street2 ?? "")
                                        .padding(.bottom, -5)
                                    Text("\(city), \(state) \(zip)")
                                }
//                                Spacer()
//                                Map {
//                                    Annotation(apiData.label, location: location )
//                                }
//                                    .frame(width: 100, height: 100)
                            }
                        })
                    } header: {
                        Text("Location")
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



    
