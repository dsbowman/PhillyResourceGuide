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
        
        
        
        

        
        List {
            VStack {
                VStack(alignment: .center) {
                    if let imageUrl = apiData.logo?.first?.url, let _ = URL(string: imageUrl) {
                        VStack() {
                            ResourceRemoteImage(urlString: imageUrl)
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 15)
    //                            .frame(width: 350, height: 100)
                                .background(.white)
                                .cornerRadius(20)
                            
                            HStack {
                                Text(apiData.label)
                                    .foregroundStyle(.primary)
                                    .multilineTextAlignment(.leading)
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "heart")
                            }
                            .padding(20)
                            
                        }


    //                    .frame(width: 350)

                    } else {
                        VStack(alignment: .center) {
                            Text(apiData.label)
                                    .foregroundStyle(Color.primary)
                                    .padding(.horizontal, 15)
                            
                        }
                        
                    }
                }
                
                
    //            largeTile(label: apiData.label, imageUrl: apiData.logo?.first?.url ?? "")
                HStack {
                    if let emergencyAssistanceNumber = apiData.emergencyAssistanceNumber {
                        ContactButton(label: "Emergency", image: "asterisk", imageColor: Color.red, action: "tel:\(emergencyAssistanceNumber)", state: false)
                    }
                    
                    if let phoneContact = apiData.phoneContact {
                        ContactButton(label: "Call", image: "phone.fill", imageColor: Color.blue, action: "tel:\(phoneContact)", state: false)
                    }
                    
                    if let street1 = apiData.street1, let city = apiData.city, let state = apiData.state, let zip = apiData.zip {
                        ContactButton(label: "Directions", image: "map.fill", imageColor: Color.blue, action:"http://maps.apple.com/?address=\(street1),\(city),\(state),\(zip)", state: false)
                    }
                }
            }
            
            if let description = apiData.descriptionNotes {
                Section {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                            .padding(.bottom, 5)
                        Text(description)
                            .textSelection(.enabled)
                    }
                }
            }
            if let hoursOfOperation = apiData.hoursOfOperation {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hours of Operation")
                            .padding(.bottom, 5)
                            .font(.caption)
                        Text(hoursOfOperation)
                            .textSelection(.enabled)
                    }
                }
            }
            
            Section {
                if let emergencyAssistanceNumber = apiData.emergencyAssistanceNumber {
                    ContactControl.emergerncy(data: emergencyAssistanceNumber)
                }
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
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Map {
//                                Annotation(apiData.label, )
                            }
                            .frame(height: 100)
                            Text("Location")
                                .font(.caption)
                            Link(destination: URL(string: "http://maps.apple.com/?address=\(street1),\(city),\(state)")!, label: {
                                VStack(alignment: .leading) {
                                    Text(street1)
                                    if let street2 = apiData.street2 {
                                        Text(street2)}
                                    Text("\(city), \(state) \(zip)")
                                }
                            })
                        }
                        .textSelection(.enabled)

                    }
                }
            }
        }
        .listStyle(.plain)

        }
    
}

    

struct DetailHeaderView: View {
    
    var apiData: Fields
    
    var body: some View {
        largeTile(label: apiData.label, imageUrl: apiData.logo?.first?.url ?? "")
        HStack {
            if let emergencyAssistanceNumber = apiData.emergencyAssistanceNumber {
                ContactButton(label: "Emergency", image: "asterisk", imageColor: Color.red, action: "tel:\(emergencyAssistanceNumber)", state: false)
            }
            
            if let phoneContact = apiData.phoneContact {
                ContactButton(label: "Call", image: "phone.fill", imageColor: Color.blue, action: "tel:\(phoneContact)", state: false)
            }
            
            if let street1 = apiData.street1, let city = apiData.city, let state = apiData.state, let zip = apiData.zip {
                ContactButton(label: "Directions", image: "map.fill", imageColor: Color.blue, action:"http://maps.apple.com/?address=\(street1),\(city),\(state),\(zip)", state: false)
            }
        }
    }
}
    
    
