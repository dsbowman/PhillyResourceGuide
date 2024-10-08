//
//  Contact Control.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/12/24.
//

import SwiftUI
import WebKit
import SafariServices

class ContactControl {
    
    struct emergerncy: View {
        var data: String
        var label = "Emergency"
        
        var body: some View {
            
            VStack(alignment: .leading) {
                Text(label)
                    .font(.caption)
                    .foregroundStyle(.red)
                Link(destination: URL(string: "tel:\(data)")!, label: {
                    Text(data)
                        .textSelection(.enabled)
                })}.textSelection(.enabled)
        }
    }
    
    struct phone: View {
        var icon = "phone.fill"
        var data: String
        var label: String?
        var fontColor: Color?
        
        var body: some View {
            
            VStack(alignment: .leading) {
                Text(label ?? "phone")
                    .font(.caption)
                Link(destination: URL(string: "tel:\(data)")!, label: {
                    Text(data)
                        .textSelection(.enabled)
                })
            }
        }
    }
    
    struct email: View {
        var icon = "envelope.fill"
        var data: String
        var label: String?
        var fontColor: Color?
        
        var body: some View {
            
            
            VStack(alignment: .leading) {
                Text(label ?? "email")
                    .font(.caption)
                Link(destination: URL(string: "mailto:\(data)")!, label: {
                    Text(data)
                        .textSelection(.enabled)
                })
            }
        }
    }
    
    struct website: View {
        @State private var showWebView = false
        var icon = "globe"
        var url: String
        var label: String?
        var fontColor: Color?

        var body: some View {
            VStack(alignment: .leading) {
                Text("website")
                    .font(.caption)

                Button(action: {
                    showWebView.toggle()
                }, label: {
                    Text(url)
                        .textSelection(.enabled)
                        .foregroundStyle(Color.blue)
                })
                .sheet(isPresented: $showWebView, content: {
                            WebView(url: URL(string: url)!)
                        .ignoresSafeArea()
                        
                        })
                    
            }
            
        }
        
    }
}


struct WebView: UIViewControllerRepresentable {
    
    var url: URL
  
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
            SFSafariViewController(url: url)
        }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}



#Preview {
    ContactControl.website(url: "dekebowman.smugmug.com") as any View
}
