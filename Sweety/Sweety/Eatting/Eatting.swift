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
    @Binding var homeViewActive: Bool
    @State private var imageIndex = 0
    @StateObject private var listModel: ListModel

  
    init(chocolateType: [String] = Chocolate().mnm,
         isSecondViewActive: Binding<Bool>,
         listModel: ListModel,
         homeViewActive: Binding<Bool>) {
        self.chocolateType = chocolateType
        self._isSecondViewActive = isSecondViewActive
        self._homeViewActive = homeViewActive  // 바인딩
        self._listModel = StateObject(wrappedValue: listModel)
    }


    var body: some View {
        VStack {
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
                if let newRandomText = TextModel.texts.randomElement() {
                    Text(newRandomText)
                        .font(Font.custom("나눔손글씨 꽃내음", size: 40))
                        .padding()
                        .onTapGesture {
                            isSecondViewActive = false
                            listModel.dataArray.append(newRandomText)
                            print(listModel.dataArray)
                            homeViewActive = false
                        }
                }
            }
        }
    }

    func nextImage() {
        imageIndex += 1
    }
}

struct Eatting_Previews: PreviewProvider {
    @State static var previewIsSecondViewActive = false
    static let listModel = ListModel()

    static var previews: some View {
        Eatting(isSecondViewActive: $previewIsSecondViewActive, listModel: listModel, homeViewActive: .constant(false))
    }
}
