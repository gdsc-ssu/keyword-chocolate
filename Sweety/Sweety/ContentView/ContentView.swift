//
//  ContentView.swift
//  Sweety
//
//  Created by 성현주 on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
            case home
            case list
        }
    
    var body: some View {
        
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            List()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
}

