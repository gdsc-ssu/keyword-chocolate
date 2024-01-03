//
//  Eatting.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Eatting: View {
    let chocolateType: [String]
    
    @State private var imageIndex = 0
    
    init(chocolateType: [String] = Chocolate().mnm) {
        self.chocolateType = chocolateType
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
    }
}

//MARK: - preview

#Preview {
    Eatting()
}
