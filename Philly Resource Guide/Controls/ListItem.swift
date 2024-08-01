//
//  ListItem.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 6/10/24.
//

import SwiftUI

struct ListItem: View {
    var label: String = "Organization Name"
    var imageUrl: String?
    var description: String?
    
    var body: some View {
        VStack(alignment: .center) {
            if let imageUrl = imageUrl, let _ = URL(string: imageUrl) {
                HStack {
//                    AsyncImage(url: url) { image in
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 120, height: 90)
//                            .cornerRadius(10)
//                            .aspectRatio(contentMode: .fill)
//
//
//                    }
                    ResourceRemoteImage(urlString: imageUrl)
                        .padding(5)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 100)
                        .background(.white)
                        .cornerRadius(10)
                        
                    Spacer().frame(width: 16)
                    
                    Text(label)
                        .fontWeight(.semibold)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .minimumScaleFactor(0.75)
                }
                
            } else {
                VStack(alignment: .leading) {
                    HStack {
                        TextItem(label: label)
                            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            .minimumScaleFactor(0.75)
                            .padding()
                        Spacer()
                        
                    }
                    
                }
                
            }
        }
        //        .alignmentGuide(.listRowSeparatorLeading) { dimension in
        //            return 0
        //        }
    }
}

#Preview {
    ListItem(label: "This is an organizations very long name", imageUrl: "https://v5.airtableusercontent.com/v3/u/24/24/1705384800000/0VQr7VMb5K7ss7csojgVTw/0VFmtIufF3yDWBVrtuS7ICq7o53BeZG2-67DdrtHDFcW2eJq5vLV7XxHGGBPBwCUluruomDXVmqmZFPWeg7kpevaCnjQfV0jCRcJmmaQFy550hgfzBInViB9XMbTgc0DvG9c1_Ipz4DoSyCC7jUMP8pZD54dTccO7lTwdZnxZeUdBSs6lzLeNBSvix0lCgEM/lyCN0ucmEAT0oS7C6swn_QNACv3mz5N_z5buSR5KrWk")
}

struct TextItem: View {
    var label:String
    var body: some View {
        Text(label)
            .font(.headline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
        
    }
}
