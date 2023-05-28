//
//  __DevoteWidget.swift
//  6-DevoteWidget
//
//  Created by giangbb on 21/11/2022.
//

import WidgetKit
import SwiftUI

//Widget's main purpose is to display a small amout of timely, personally relevant information that people can view without openning app
//Building widget:
    //1. Family: The template a widget uses: small, medium, or large. Widgets can support 1 or more sizes giving users the flexibility to configure their widgets however they like
    //2. Timeline: an object that specifies a date for WidgetKit to update a widget's view. A timeline contains an array of timeline entry objects and a refresh policy.
    //3. Entry: each entry specifies the date we would like WidgetKit to update the widget's view and any additional information that our widget needs to render the view


//TimelineProvider advises widgetkit when to update widget's display
struct Provider: TimelineProvider {
    //placeholder() function provides a timeline entry representing a placeholder version of the widget
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    //getSnapshot() function provides a timeline entry that represents the current time and state of the widget
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    //getTimeline() function provides an array of timeline entries for the current time and optionally any future times to update the widget
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
    let date: Date  //a date that widgetkit can render widget
}

//this is where we create the actual layout and design for the widget
struct __DevoteWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var fontStyle : Font {
        if widgetFamily == .systemSmall {
            return .system(.footnote, design: .rounded)
        } else{
            return .system(.headline, design: .rounded)
        }
    }

    var body: some View {
        GeometryReader {   geometry in
            ////note: when we wrap any view inside geometry container -> the origin point will be changed from the center to top-left -> that's why TextView moved it position from center to top-left
//            Text("width: \(Int(geometry.size.width)) - heigh: \(geometry.size.height)")
            
            ZStack{ //inside zstack, views's origin point still in center
                backgroundGradient
                
                Image("rocket-small")
                    .resizable()
                    .scaledToFit()
                
                
                Image("logo")
                    .resizable()
                    .frame(
                        width: widgetFamily != .systemSmall ? 56 : 36,
                        height: widgetFamily != .systemSmall ? 56 : 36
                    )
                    .offset(x: (geometry.size.width / 2) - 20, y: (geometry.size.height / -2) + 20)
                    .padding(.top, widgetFamily != .systemSmall ? 32 : 12)
                    .padding(.trailing, widgetFamily != .systemSmall ? 32 : 12)
                
                HStack {
                    Text("Just Do It")
                        .foregroundColor(.white)
                        .font(fontStyle)
                        .fontWeight(.bold)
                        .padding(.horizontal,12)
                        .padding(.vertical, 4)
                        .background(
                            Color(red: 0, green: 0, blue: 0, opacity: 0.5)
                                .blendMode(.overlay)
                        )
                    .clipShape(Capsule())
                    
                    if widgetFamily != .systemSmall {
                        Spacer()
                    }
                    
                }//: HSTACK
                .padding()
                .offset(y: (geometry.size.height / 2) - 40)
                
                
                
            }//: ZSTACK
        }//: GEOMETRY
    }
}

//this is the most crucial part of widget creation
struct __DevoteWidget: Widget {
    let kind: String = "__DevoteWidget"

    var body: some WidgetConfiguration {
        //SwiftUI provides us 2 types of structs that confirm to widget configuration:
        // - StaticConfiguration: allow us to register a widget that configured by the developer, from time to time update its data. StaticConfiguration needs 3 params:
            //= kind: is a string that identifies the widget
            //= provider: that conforms to the TimelineProvider protocol and is used by the system to fetch widget data
            //= content: describes the View for displaying widget data
            // => with all these settings, the system will try to predict the best time to perform widget updates using providers, but we can always ask to update widgets using widget center
        
        // - IntentConfiguration: we use this config to provide user configurable options for our widget (for ex: with apple weather widget, we can select the current weather conditions and forecast for a location)
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            __DevoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is an example widget for the personal task manager app.")
    }
}

struct __DevoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            __DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            __DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            __DevoteWidgetEntryView(entry: SimpleEntry(date: Date()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
