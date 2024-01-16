//
//  Header.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/10/24.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack(alignment: .center) {
                Image("SmallThings")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
        }
        .padding(.vertical, -25)
    }
}

#Preview {
    Header()
}
