//
//  NotificationViewController.swift
//  Notification
//
//  Created by Vince Davis on 4/7/24.
//

import HeroiOS
import HeroShared
import SwiftUI

#if os(macOS)
import AppKit

class NotificationViewController: NSViewController {

    var viewModel: NotificationModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 300)
        self.add(swiftUIView: AnyView(NotificationView(viewModel: viewModel)))
    }
}
#endif

#if os(iOS) || os(visionOS)
import UIKit

class NotificationViewController: UIViewController {
    var viewModel: NotificationModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 300)
        self.add(swiftUIView: AnyView(NotificationView(viewModel: viewModel)))
    }
}
#endif
