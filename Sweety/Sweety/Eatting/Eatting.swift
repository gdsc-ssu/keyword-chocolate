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
    
    init(chocolateType: [String] = Chocolate().mnm,isSecondViewActive: Binding<Bool>) {
        self.chocolateType = chocolateType
        self._isSecondViewActive = isSecondViewActive
    }
    
//MARK: - view
    var body: some View {
        Image(chocolateType[imageIndex])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                self.nextImage()
            }
    }
    
//MARK: - helper
    func nextImage() {
        imageIndex = (imageIndex + 1) % chocolateType.count
        if imageIndex == 0 {
                    isSecondViewActive = false
                }
    }
}

//MARK: - preview

struct Eatting_Previews: PreviewProvider {
    @State static var previewIsSecondViewActive = false
    
    static var previews: some View {
        Eatting(isSecondViewActive: $previewIsSecondViewActive)
    }
}
