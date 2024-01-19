//
//  DynamicislandWidgetLiveActivity.swift
//  DynamicislandWidget
//
//  Created by 성현주 on 1/19/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DynamicislandWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var time: String
        var intTime: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    var totalTime = 200.0
}


struct DynamicislandWidgetLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: DynamicislandWidgetAttributes.self) { context in
      // Lock screen/banner UI goes here
      VStack {
          Text("\(context.state.time)")
      }
      //.activityBackgroundTint(Color.gray)
      //.activitySystemActionForegroundColor(Color.black)
      
    } dynamicIsland: { context in
      DynamicIsland {
        // Expanded UI goes here.  Compose the expanded UI through
          // various regions, like leading/trailing/center/bottom
          
          DynamicIslandExpandedRegion(.center) {
              VStack{
                  HStack{
                      Image("m&m0")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 20,height: 20)
                      Text("남은시간😋:\(context.state.time)")
                  }
                  HStack{
                      Text("🍫")
                      ProgressView("", value: (context.attributes.totalTime - (Double(context.state.intTime))) / context.attributes.totalTime)
                      Text("🍩")
                  }
              }
          }
      } compactLeading: {
        Text("🍫")
      } compactTrailing: {
        Text("🍩")
      } minimal: {
        Text("🍭")
      }
      .keylineTint(Color.white)
    }
  }
}
