//
//  PushUpsWidget.swift
//  PushUpsWidget
//
//  Created by NadaAshraf on 18/09/2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct PushUpsWidgetEntryView : View {
    private let greyColor = Color(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1))
    var entry: Provider.Entry
    
    var body: some View {
        VStack {
            Text("Pushups")
                .font(.system(size: 27))
                .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)))
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
            
            middleView
            bottomView.padding(.horizontal, 6.0)
            
        }
    }
    
    var middleView: some View{
        HStack(spacing: 25){
            Image("minus")
            Text("0")
                .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                .font(.system(size: 36))
            Image("plus")
        }
    }
    
    var bottomView: some View{
        HStack{
            HStack(spacing: 7){
                Image("calender")
                Text("9")
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                    .font(.system(size: 24))
            }
            
            Spacer()
            
            HStack(spacing: 3){
                Image("champion")
                Text("12")
                    .foregroundColor(Color(UIColor(red: 0.18, green: 0.5, blue: 0.93, alpha: 1)).opacity(0.5))
                    .font(.system(size: 24))
            }
        }
    }
    
}

struct PushUpsWidget: Widget {
    let kind: String = "PushUpsWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            PushUpsWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    PushUpsWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
