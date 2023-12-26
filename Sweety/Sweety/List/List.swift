//
//  List.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

import SwiftUI

struct List: View {
    
    var body: some View {
        
        ScrollView() {
            VStack {
                ForEach(1..<100) {
                    Text("item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    List()
}
