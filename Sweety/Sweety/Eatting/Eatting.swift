//
//  Eatting.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct Eatting: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Spacer()

            Rectangle()
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            withAnimation {
                                self.scale *= 0.5
                            }
                        }
                )

            Spacer()
        }
    }
}

#Preview {
    Eatting()
}
