//
//  NotificationViewController.swift
//  Notification
//
//  Created by Vince Davis on 4/7/24.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import Heroes
import SwiftUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    var viewModel: NotificationModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 300)
        self.add(swiftUIView: AnyView(NotificationView(viewModel: viewModel)))
//        let childView = UIHostingController(rootView: NotificationView(viewModel: self.viewModel))
//        addChild(childView)
//        //childView.view.frame = view.bounds
//        view.addSubview(childView.view)
//        childView.didMove(toParent: self)
//        
//        childView.view.translatesAutoresizingMaskIntoConstraints = false
//        childView.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
//        childView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        childView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
//        childView.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

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
