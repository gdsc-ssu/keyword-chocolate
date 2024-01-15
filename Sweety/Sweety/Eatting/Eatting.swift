//
//  Eatting.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Eatting: View {
    let chocolateType: [String]
    
    @Binding var isSecondViewActive: Bool
    @State private var imageIndex = 0
    
    init(chocolateType: [String] = Chocolate().mnm, isSecondViewActive: Binding<Bool>) {
        self.chocolateType = chocolateType
        self._isSecondViewActive = isSecondViewActive
    }

    var body: some View {
        VStack{
            if imageIndex < chocolateType.count {
                Image(chocolateType[imageIndex])
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        self.nextImage()
                    }
                Text("클릭으로 초콜릿을 먹어주세요")
                    .font(Font.custom("나눔손글씨 꽃내음", size: 32))
                
                
            } else {
                Text("우리 글귀!")
                    .font(Font.custom("나눔손글씨 꽃내음", size: 40))
                    .padding()
                    .onTapGesture {
                        isSecondViewActive = false
                    }
            }
        }
    }

    func nextImage() {
        imageIndex += 1
    }
}

//MARK: - preview

struct Eatting_Previews: PreviewProvider {
    @State static var previewIsSecondViewActive = false
    
    static var previews: some View {
        Eatting(isSecondViewActive: $previewIsSecondViewActive)
    }
}
