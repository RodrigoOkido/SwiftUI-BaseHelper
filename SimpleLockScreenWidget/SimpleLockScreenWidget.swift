//
//  SimpleLockScreenWidget.swift
//  SimpleLockScreenWidget
//
//  Created by Rodrigo Okido on 21/10/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let sampleText: String = "I am a widget"
}

struct SimpleLockScreenWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            Gauge(value: 0.4) {
                Text(entry.date, format: .dateTime.year())
            }
            .gaugeStyle(.accessoryCircular)
        case .accessoryInline:
            Text(entry.sampleText)
        case .accessoryRectangular:
            Gauge(value: 0.8) {
                Text(entry.date, format: .dateTime.year())
            }
            .gaugeStyle(.accessoryLinear)
        default: Text("Not implemented")
        }
    }
}

@main
struct SimpleLockScreenWidget: Widget {
    let kind: String = "SimpleLockScreenWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SimpleLockScreenWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryInline, .accessoryRectangular])
    }
}

struct SimpleLockScreenWidget_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLockScreenWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
