//
//  Header.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/10/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("SmallThings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.padding(-25)
                
                Text("Philadelphia Resource Guide")
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.cyan)
            }
        }
    }
}

#Preview {
    Header()
}
