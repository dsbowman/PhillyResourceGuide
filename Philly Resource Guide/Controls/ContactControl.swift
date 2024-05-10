//
//  Contact Control.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/12/24.
//

import SwiftUI
import WebKit

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
//                NavigationLink {
//                    WebView(url: url)
//                } label: {
//                    Link(destination: URL(string: url)!, label: {
//                        Text(url)
//                            .textSelection(.enabled)
//                    })
//                }
                
                Button(action: {
                    showWebView.toggle()
                }, label: {
                    Text(url)
                        .textSelection(.enabled)
                        .foregroundStyle(Color.blue)
                })
                .sheet(isPresented: $showWebView, content: {
                    NavigationView {
                        VStack {
                            WebView(url: url)
                        }
                        .toolbar (content: {
                            ToolbarItem(placement: .automatic) {
                                ShareLink(item: URL(string: url)!) {
                                    Label("Share", systemImage: "square.and.arrow.up")
                                }
                            }
                            ToolbarItem(placement: .automatic) {
                                Button("Done") {
                                    showWebView = false
                                }
                            }

                        })
                    }

                    
                })
            }
        }
        
    }
}


struct WebView: UIViewRepresentable{
    
    var url:String
    
    
    func makeUIView(context: Context) -> some UIView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        return webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


#Preview {
    ContactControl.website(url: "dekebowman.smugmug.com") as any View
}
