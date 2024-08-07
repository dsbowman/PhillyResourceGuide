//
//  ContentView.swift
//  Community Resource Guide
//
//  Created by Deke Bowman on 1/3/24.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TileListView()
                .tabItem { Label("List", systemImage: "list.bullet") }
            
//            ListView()
//                .tabItem { Label("List", systemImage: "list.bullet") }
            
            MapView()
                .tabItem { Label("Map", systemImage: "globe")}
            
            
            
        }
        .accentColor(.teal)
//        .overlay(alignment: .topTrailing) {
//            Button {
//                print("New Resource")
//            } label: {
//                Image(systemName: "plus.circle.fill")
//                    .imageScale(.large)
//                    .fontWeight(.semibold)
//                    .tint(.teal)
//            }
//        }
//        .overlay(alignment: .bottom) {
//            Button {
//                print("Map View")
//            } label: {
//                ZStack {
//                    Circle()
//                        .frame(width: 50, height: 50)
//                        .foregroundStyle(.teal)
//                    Image(systemName: "map.fill")
//                        .imageScale(.large)
//                        .buttonBorderShape(.circle)
//                        .tint(.white)
//                }
//                
//                
//                
//            }
//            
//        }
        
        
        

    }
}



#Preview {
    ContentView()
}



