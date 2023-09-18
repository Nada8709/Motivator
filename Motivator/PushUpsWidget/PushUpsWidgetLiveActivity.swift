//
//  PushUpsWidgetLiveActivity.swift
//  PushUpsWidget
//
//  Created by NadaAshraf on 18/09/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PushUpsWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PushUpsWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PushUpsWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PushUpsWidgetAttributes {
    fileprivate static var preview: PushUpsWidgetAttributes {
        PushUpsWidgetAttributes(name: "World")
    }
}

extension PushUpsWidgetAttributes.ContentState {
    fileprivate static var smiley: PushUpsWidgetAttributes.ContentState {
        PushUpsWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PushUpsWidgetAttributes.ContentState {
         PushUpsWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PushUpsWidgetAttributes.preview) {
   PushUpsWidgetLiveActivity()
} contentStates: {
    PushUpsWidgetAttributes.ContentState.smiley
    PushUpsWidgetAttributes.ContentState.starEyes
}
