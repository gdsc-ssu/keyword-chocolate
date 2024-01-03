//
//  ContentView.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        
        NavigationStack{
            NavigationLink(destination: Eatting()) {
                Image("m&m0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
    }
}


#Preview {
    Home()
}
