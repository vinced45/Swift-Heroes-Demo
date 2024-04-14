//
//  NotificationViewController+UserNotifications.swift
//  Notification
//
//  Created by Vince Davis on 4/13/24.
//

#if canImport(UserNotifications)
import UserNotifications
import UserNotificationsUI

extension NotificationViewController: UNNotificationContentExtension {
    func didReceive(_ notification: UNNotification) {
        let cat = notification.request.content.categoryIdentifier

        viewModel.catergory = cat
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        if response.actionIdentifier == "testNotification.changeAction" {
            //self.scrollNextItem()
            viewModel.changeRating()
            completion(UNNotificationContentExtensionResponseOption.doNotDismiss)
        } else if response.actionIdentifier == "testNotification.playAction" {
            //self.scrollPreviousItem()
            viewModel.play()
            completion(UNNotificationContentExtensionResponseOption.doNotDismiss)
        } else if response.actionIdentifier == "testNotification.slideAction" {
            //self.scrollPreviousItem()
            viewModel.slide()
            completion(UNNotificationContentExtensionResponseOption.doNotDismiss)
        } else if response.actionIdentifier == "testNotification.pauseAction" {
            //self.scrollPreviousItem()
            viewModel.pause()
            completion(UNNotificationContentExtensionResponseOption.doNotDismiss)
        } else if response.actionIdentifier == "testNotification.submitAction" {
            //self.scrollPreviousItem()
            completion(UNNotificationContentExtensionResponseOption.dismiss)
        } else {
            //completion(UNNotificationContentExtensionResponseOption.dismissAndForwardAction)
            completion(UNNotificationContentExtensionResponseOption.doNotDismiss)
        }
    }
}
#endif
