//
//  List.swift
//  Sweety
//
//  Created by 성현주 on 12/23/23.
//

// List.swift

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listModel: ListModel
    
    var body: some View {
        VStack{
            Text("글귀 리스트")
                .font(Font.custom("나눔손글씨 꽃내음", size: 32))
            List(listModel.dataArray, id: \.self) { item in
                Text(item)
                    .font(Font.custom("나눔손글씨 꽃내음", size: 32))
            }
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        // 여기서 EnvironmentObject를 주입.=> 이거때문에 2시간 날림 ㅋㅋㅋㅋ
        ListView().environmentObject(ListModel())
    }
}
