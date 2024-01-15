//
//  ContentView.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Home: View {
    @State var isEattingViewActive = false
    
    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()
            
            Spacer()
            
            Button(action: {
                isEattingViewActive = true
            }) {
                Image("m&m0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .padding()
            
        }
        
        .fullScreenCover(isPresented: $isEattingViewActive, content: {
                        Eatting(isSecondViewActive: $isEattingViewActive)
                    })
    }
}

#Preview {
    Home()
}
