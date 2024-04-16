//
//  ContentView.swift
//  HeroesWatch Watch App
//
//  Created by Vince Davis on 4/11/24.
//

import SwiftUI
import UserNotifications
import HeroShared

let activityType = "com.swiftheroes.speakers"

struct ContentView: View {
    @State var selectedItem: ListItem? = nil
    
    @State var items: [ListItem] = Speaker.all.map({ ListItem(id: $0.id, title: $0.title, subtitle: $0.subtitle, image: $0.image, badges: [], type: .speaker, items: nil)})
    var body: some View {
        NavigationSplitView(sidebar: {
            List(items, selection: $selectedItem) { item in
                NavigationLink(value: item, label: {
                    HStack {
                        item.image.resizable().frame(width: 20, height: 20)
                        Text(item.title)
                    }
                    .containerBackground(Color.heroOrange.gradient, for: .navigation)
                })
            }
        }, detail: {
            if let item = selectedItem {
                VStack {
                    item.image.resizable()
                    
                    Text(item.title)
                }
                .containerBackground(Color.heroOrange.gradient, for: .navigation)
                .userActivity(activityType, element: item, { element, activity in
                    let bundleid = Bundle.main.bundleIdentifier ?? ""
                    activity.addUserInfoEntries(from: ["id": item.id,
                                                       "name": item.title,
                                                       "setby": bundleid])
                    //activity.el
                    logUserActivity(activity, label: "Item")
                })
            }
        })
        .task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(
                options: [.alert, .sound, .badge]
            )
        }
        
    }
    
    func logUserActivity(_ activity: NSUserActivity, label: String = "") {
        print("\(label) TYPE = \(activity.activityType)")
        print("\(label) INFO = \(activity.userInfo ?? [:])")
    }
}

#Preview {
    ContentView()
}
