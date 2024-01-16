//
//  ContentView.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Home: View {
    @State var isEattingViewActive = false
    @EnvironmentObject var listModel: ListModel

    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()

            Spacer()

            Button(action: {
                isEattingViewActive = true
                print(listModel.dataArray)
            }) {
                Image("m&m0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .padding()
        }
        
        .fullScreenCover(isPresented: $isEattingViewActive, content: {
            // Eatting 뷰 호출할 때 listModel을 주입.
            Eatting(isSecondViewActive: $isEattingViewActive, listModel: listModel)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
