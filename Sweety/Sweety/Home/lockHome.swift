//
//  UnlockHome.swift
//  Sweety
//
//  Created by 성현주 on 1/17/24.
//

import SwiftUI

struct LockHome: View {
    @Binding var homeViewActive: Bool  
    @State private var remainingTime: TimeInterval = 1 * 1 * 10
    let timerInterval: TimeInterval = 1.0

    var body: some View {
        VStack {
            Text("남은 시간: \(formattedTime(remainingTime))")
                .padding()
                .font(.headline)
        }
        .onAppear {
            startTimer()
        }
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            remainingTime -= timerInterval

            if remainingTime <= 0 {
                stopTimer()
                homeViewActive = true
            }
        }
    }

    private func stopTimer() {
        // 타이머가 멈출 때 추가 작업
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
