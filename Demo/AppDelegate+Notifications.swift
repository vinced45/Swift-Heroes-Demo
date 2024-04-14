//
//  AppDelegate+Notifications.swift
//  Demo
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation

#if os(iOS) || os(visionOS) || os(macOS)
import UserNotifications

extension AppDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("Receive notification in the foreground \(userInfo)")
        let pref = UserDefaults.init(suiteName: "group.id.gits.notifserviceextension")
        pref?.set(userInfo, forKey: "NOTIF_DATA")
        //guard let vc = UIApplication.shared.windows.first?.rootViewController as? ViewController else { return }
        //vc.handleNotifData()
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
            //if let customData = userInfo["customData"] as? String {
                //print("Custom data received: \(customData)")

                switch response.actionIdentifier {
                case UNNotificationDefaultActionIdentifier:
                    // the user swiped to unlock
                    print("Default identifier")
                case "testNotification.doneAction":
                    // the user tapped our "show more info…" button
                    print("Done more information…")
                case "testNotification.openAction":
                    // the user tapped our "show more info…" button
                    print("Open more information…")
                default:
                    break
                }
           // }
        completionHandler()
    }
}
#endif
