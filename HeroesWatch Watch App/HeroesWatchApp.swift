//
//  HeroesWatchApp.swift
//  HeroesWatch Watch App
//
//  Created by Vince Davis on 4/11/24.
//

import SwiftUI
import HeroShared
import UserNotifications

import AVKit
import Foundation

@main
struct HeroesWatch_Watch_AppApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
       WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
    }
}

import AVFoundation
struct NotificationView: View {
    var speaker: Speaker = .alex
    @State var isSwitched: Bool = false
    public var player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "highlights", withExtension: "mp4")!)
    
    var body: some View {
        VStack {
//            speaker.image
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(5.0)
            VideoPlayer(player: player).scaledToFit()

            Text(speaker.name)
                .font(.headline)
            
            //Toggle("Test Me", isOn: $isSwitched)
            Button("Play", action: { player.play() })

            Divider()

            if isSwitched {
                Text("You are within 5 miles of one of your favorite landmarks.")
                    .font(.caption)
            }
        }
    }
}


#Preview {
    NotificationView()
}

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(speaker: .alberto)
        
    }
    
    override class var isInteractive: Bool {
        return true
    }
    
    override class var sashColor: Color? {
        return Color.heroBlue
    }
     
    override class var wantsSashBlur: Bool {
        return true
    }
     
    override class var titleColor: Color? {
        return .heroOrange
    }
     
    override class var subtitleColor: Color? {
        return .secondary
    }

    override func didReceive(_ notification: UNNotification) {
        //let modelData = ModelData()
        self.notificationActions = [.init(identifier: "action_identifier", title: "Dynamic action title")]
        let notificationData =
            notification.request.content.userInfo as? [String: Any]

//        let aps = notificationData?["aps"] as? [String: Any]
//        let alert = aps?["alert"] as? [String: Any]
//
//
//        title = alert?["title"] as? String
//        message = alert?["body"] as? String
//
//
//        if let index = notificationData?[landmarkIndexKey] as? Int {
//            landmark = modelData.landmarks[index]
//        }
    }
}
