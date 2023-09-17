//
//  PushUpsWidgetBundle.swift
//  PushUpsWidget
//
//  Created by NadaAshraf on 13/09/2023.
//

import WidgetKit
import SwiftUI

@main
struct PushUpsWidgetBundle: WidgetBundle {
    var body: some WidgetConfiguration {
        PushUpsWidget()
        PushUpsWidgetLiveActivity()
    }
}
