//
//  TileView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/4/24.
//

import SwiftUI



struct TileView: View {
    var label: String = "Organization Name"
    var imageUrl: String?
    var description: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(15)
                    
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                HStack(alignment: .center){
                    Spacer()
                    Text(label)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                }
                    
            } else {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                
            }
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimension in
            return 0
        }
    }
}

#Preview {
    TileView()
}
