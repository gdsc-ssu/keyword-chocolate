//
//  UnlockHome.swift
//  Sweety
//
//  Created by 성현주 on 1/17/24.
//

import SwiftUI

struct LockHome: View {
    @Binding var homeViewActive: Bool  
    @State private var remainingTime: TimeInterval = 1 * 1 * 10 //24*60*60으로 하면 24시간
    let timerInterval: TimeInterval = 1.0

    var body: some View {
        ZStack {
            Image("lockHome")
                .resizable()
                .scaledToFill()
            
            Text("\(formattedTime(remainingTime))")
                .padding()
                .font(Font.custom("나눔손글씨 꽃내음", size: 35))
                .offset(x: 15 , y: -105)
        }
        .onAppear {
            startTimer()
        }
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            remainingTime -= timerInterval

            if remainingTime <= 0 {
                homeViewActive = true
                remainingTime = 1 * 1 * 10
                //여기도 테스트위해 바꿔놓은곳
                print("시간끝")
            }
        }
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: time) ?? "00:00:00"
    }
}

#Preview {
    LockHome(homeViewActive: .constant(false))
}
