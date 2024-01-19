//
//  UnlockHome.swift
//  Sweety
//
//  Created by 성현주 on 1/17/24.
//

import SwiftUI
import WidgetKit
import ActivityKit
import Combine

struct LockHome: View {
    @Binding var homeViewActive: Bool
    @State private var remainingTime: TimeInterval = 1 * 2 * 60 //24*60*60으로 하면 24시간
    @State private var timerStarted = false
    let timerInterval: TimeInterval = 1.0
    var activity: Activity<DynamicislandWidgetAttributes>?
    
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
            if !timerStarted {
                startTimer()
                timerStarted = true
                ///////////////////////////
            }
        }
    }
    
    private func startTimer()  {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { timer in
            remainingTime -= timerInterval
            updateTime()
            print(remainingTime)
            if remainingTime <= 0 {
                homeViewActive = true
                remainingTime = 1 * 1 * 10
                //여기도 테스트위해 바꿔놓은곳
                print("시간끝")
                Notify()
                timer.invalidate()
            }
            
            //MARK: - dynamicisland
        }
        let dynamicislandWidgetAttributes = DynamicislandWidgetAttributes(name: "test")
        let contentState = DynamicislandWidgetAttributes.ContentState(time: "f", intTime: 0)
        do {
            var localSelf = self
            localSelf.activity = try Activity.request(attributes: dynamicislandWidgetAttributes, contentState: contentState)
        } catch {
            print(error)
        }
        
    }
    
    func updateTime() {
        Task {
            let updatedTime = DynamicislandWidgetAttributes.ContentState(time: (formattedTime(remainingTime)), intTime: Int(remainingTime))
            
            for activity in Activity<DynamicislandWidgetAttributes>.activities{
                await activity.update(using: updatedTime)
                print(updatedTime)
            }
        }
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: time) ?? "00:00:00"
    }
    
    
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "시간끝"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

#Preview {
    LockHome(homeViewActive: .constant(false))
}
