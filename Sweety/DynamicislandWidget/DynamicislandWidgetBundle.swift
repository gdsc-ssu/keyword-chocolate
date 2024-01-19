//
//  DynamicislandWidgetBundle.swift
//  DynamicislandWidget
//
//  Created by 성현주 on 1/19/24.
//

import WidgetKit
import SwiftUI

@main
struct DynamicislandWidgetBundle: WidgetBundle {
    var body: some Widget {
        DynamicislandWidget()
        DynamicislandWidgetLiveActivity()
    }
}
