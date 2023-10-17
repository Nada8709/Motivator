//
//  SitupsWidgetLiveActivity.swift
//  SitupsWidget
//
//  Created by NadaAshraf on 17/10/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SitupsWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SitupsWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SitupsWidgetAttributes.self) { context in
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

extension SitupsWidgetAttributes {
    fileprivate static var preview: SitupsWidgetAttributes {
        SitupsWidgetAttributes(name: "World")
    }
}

extension SitupsWidgetAttributes.ContentState {
    fileprivate static var smiley: SitupsWidgetAttributes.ContentState {
        SitupsWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SitupsWidgetAttributes.ContentState {
         SitupsWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SitupsWidgetAttributes.preview) {
   SitupsWidgetLiveActivity()
} contentStates: {
    SitupsWidgetAttributes.ContentState.smiley
    SitupsWidgetAttributes.ContentState.starEyes
}
