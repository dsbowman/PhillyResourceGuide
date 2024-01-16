//
//  Category View.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/3/24.
//

import SwiftUI



struct CategoryListTile: View {
    var label: String = " Title"
    var description: String = "Description"
    var image: String = "puzzlepiece.fill"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                }
                .frame(width: 50)
                Text(label)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }


    }
}

#Preview {
    CategoryListTile()
}
