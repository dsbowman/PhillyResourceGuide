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
        VStack(alignment: .center) {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                HStack {
                    Spacer()
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(15)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 125)
                    Spacer()
                }
                HStack(alignment: .center){
                    Spacer()
                    TextLabel(label: label)
                    Spacer()
                }
                    
            } else {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        TextLabel(label: label)
                        Spacer()
                    }
                    
                }
                
            }
        }
        .alignmentGuide(.listRowSeparatorLeading) { dimension in
            return 0
        }
    }
}

#Preview {
    TileView(label: "This is an organizations very long name", imageUrl: "https://v5.airtableusercontent.com/v3/u/24/24/1705384800000/0VQr7VMb5K7ss7csojgVTw/0VFmtIufF3yDWBVrtuS7ICq7o53BeZG2-67DdrtHDFcW2eJq5vLV7XxHGGBPBwCUluruomDXVmqmZFPWeg7kpevaCnjQfV0jCRcJmmaQFy550hgfzBInViB9XMbTgc0DvG9c1_Ipz4DoSyCC7jUMP8pZD54dTccO7lTwdZnxZeUdBSs6lzLeNBSvix0lCgEM/lyCN0ucmEAT0oS7C6swn_QNACv3mz5N_z5buSR5KrWk")
}

struct TextLabel: View {
    var label:String
    var body: some View {
        Text(label)
            .font(.title3)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding(.bottom, 10)
    }
}
