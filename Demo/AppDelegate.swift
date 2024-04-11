//
//  AppDelegate.swift
//  Demo
//
//  Created by Vince Davis on 4/7/24.
//

import Foundation
import SwiftUI
import UserNotifications
import Heroes

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = self
        NotificationHelper().setup()
        application.registerForRemoteNotifications()
        
        return true
    }
}
