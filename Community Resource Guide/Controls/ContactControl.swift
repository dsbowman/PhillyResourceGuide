//
//  Contact Control.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/12/24.
//

import SwiftUI

class ContactControl {
    
    struct phone: View {
        var icon = "phone.fill"
        var data: String
        
        var body: some View {
            
            
            VStack(alignment: .leading) {
                Text("phone")
                    .font(.caption)
                Link(destination: URL(string: "tel:\(data)")!, label: {
                    Text(data)
                })
            }
        }
    }
    
    struct email: View {
        var icon = "envelope.fill"
        var data: String
        
        var body: some View {
            
            
            VStack(alignment: .leading) {
                Text("email")
                    .font(.caption)
                Link(destination: URL(string: "mailto:\(data)")!, label: {
                    Text(data)
                })
            }
        }
    }
    
    struct website: View {
        var icon = "globe"
        var url: String

        var body: some View {
            VStack(alignment: .leading) {
                Text("website")
                    .font(.caption)
                Link(destination: URL(string: url)!, label: {
                    Text(url)
                })
            }
            
        }
    }
    
}

#Preview {
    ContactControl.website(url: "dekebowman.smugmug.com") as any View
}
