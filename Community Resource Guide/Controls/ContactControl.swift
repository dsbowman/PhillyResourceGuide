//
//  Contact Control.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/12/24.
//

import SwiftUI

struct PhoneContact: View {
    
    var icon: String
    var data: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
            Link(destination: URL(string: "tel:\(data)")!, label: {
                Text(data)
            })
        }
    }
}

#Preview {
    ContactControl(icon:"phone.fill", data:"812-552-9102")
}
