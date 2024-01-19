//
//  ContentView.swift
//  Sweety
//
//  Created by 성현주 on 12/26/23.
//

//커밋해볼게요

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @StateObject private var listModel = ListModel()
    @AppStorage("homeViewActive") private var homeViewActive = true
    
    enum Tab {
        case home
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            if homeViewActive == true {
                Home(homeViewActive: $homeViewActive)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)
            } else {
                LockHome(homeViewActive: $homeViewActive)
                    .tabItem {
                        Label("lock", systemImage: "lock")
                    }
                    .tag(Tab.home)
            }
            
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .environmentObject(listModel)
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
    }
}




#Preview {
    ContentView()
}

