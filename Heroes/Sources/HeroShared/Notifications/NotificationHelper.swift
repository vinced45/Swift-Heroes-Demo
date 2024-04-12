//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import UserNotifications

public struct NotificationHelper {
    public init() {}
    public func setup() {
        let changeAction = UNNotificationAction(identifier: "testNotification.changeAction",
                                              title: "Change Rating",
                                              options: [],
                                              icon: .init(systemImageName: "star.fill"))
        let submitAction = UNNotificationAction(identifier: "testNotification.submitAction",
                                              title: "Submit",
                                                options: [.destructive],
                                              icon: .init(systemImageName: "paperplane.fill"))
        let testNotifCategory = UNNotificationCategory(identifier: "default",
                                                       actions: [changeAction, submitAction],
                                                       intentIdentifiers: [],
                                                       options: [])
        
        let playAction = UNNotificationAction(identifier: "testNotification.playAction",
                                              title: "Play",
                                              options: [],
                                              icon: .init(systemImageName: "play.fill"))
        let pauseAction = UNNotificationAction(identifier: "testNotification.pauseAction",
                                              title: "Pause",
                                              options: [],
                                              icon: .init(systemImageName: "pause.fill"))
        let videoNotifCategory = UNNotificationCategory(identifier: "video",
                                                       actions: [playAction, pauseAction],
                                                       intentIdentifiers: [],
                                                       options: [])
        
        let action = UNNotificationAction(identifier: "testNotification.slideAction",
                                              title: "Slide",
                                              options: [],
                                              icon: .init(systemImageName: "photo.artframe"))

        let imageNotifCategory = UNNotificationCategory(identifier: "images",
                                                       actions: [action],
                                                       intentIdentifiers: [],
                                                       options: [])
        
        let statusAction = UNNotificationAction(identifier: "testNotification.showFlight",
                                              title: "Show Flight Status",
                                              options: [],
                                              icon: .init(systemImageName: "airplane"))

        let statusNotifCategory = UNNotificationCategory(identifier: "flightStatus",
                                                       actions: [statusAction],
                                                       intentIdentifiers: [],
                                                       options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([testNotifCategory,imageNotifCategory,videoNotifCategory, statusNotifCategory])
        
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
    }
}
