//
//  DetailViewModel.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 2/8/24.
//

import Foundation
import SwiftUI

//class DetailViewModel: ObservableObject {
//    var apiData: Fields
//    var section: Array<Any>
//    
//            if let description = apiData.descriptionNotes {
//                
//                    VStack(alignment: .leading) {
//                        Text("Description")
//                            .font(.caption)
//                            .padding(.bottom, 5)
//                        Text(description)
//                            .textSelection(.enabled)
//                        
//                        
//                }
//                
//            }
//                
//            if let hoursOfOperation = apiData.hoursOfOperation {
//                Section {
//                    VStack(alignment: .leading) {
//                        Text("Hours of Operation")
//                            .padding(.bottom, 5)
//                            .font(.caption)
//                        Text(hoursOfOperation)
//                            .textSelection(.enabled)
//                    }
//                }
//            }
//            
//            Section {
//                if let emergencyAssistanceNumber = apiData.emergencyAssistanceNumber {
//                    ContactControl.emergerncy(data: emergencyAssistanceNumber)
//                }
//                if let phoneContact = apiData.phoneContact {
//                    ContactControl.phone(data: phoneContact) }
//                if let phoneContact2 = apiData.phoneContact2 {
//                    ContactControl.phone(data: phoneContact2) }
//                if let email = apiData.email {
//                    ContactControl.email(data: email) }
//                if let url = apiData.url {
//                    ContactControl.website(url: url) }
//            }
//            
//            if let street1 = apiData.street1, let city = apiData.city, let state = apiData.state, let zip = apiData.zip {
//                Section {
//                    
//                    HStack(alignment: .top) {
//                        VStack(alignment: .leading) {
//                            Map()
//                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
//                            Text("Location")
//                                .font(.caption)
//                            Link(destination: URL(string: "http://maps.apple.com/?address=\(street1),\(city),\(state)")!, label: {
//                                VStack(alignment: .leading) {
//                                    Text(street1)
//                                    if let street2 = apiData.street2 {
//                                        Text(street2)}
//                                    Text("\(city), \(state) \(zip)")
//                                }
//                            })
//                        }
//                        .textSelection(.enabled)
//
//                    }
//                }
//            }
//}
//
