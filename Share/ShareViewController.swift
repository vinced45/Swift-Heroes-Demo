//
//  ShareViewController.swift
//  Share
//
//  Created by Vince Davis on 4/7/24.
//

import Social
import SwiftUI
import HeroiOS
import HeroShared

#if os(iOS)
import UIKit

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //preferredContentSize = CGSize(width: 320, height: 300)
        self.add(swiftUIView: AnyView(SwiftUIView(action: close)))
        //self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    /// Close the Share Extension
    func close() {
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}
#endif

#if os(macOS)
import AppKit

class ShareViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //preferredContentSize = CGSize(width: 320, height: 300)
        self.add(swiftUIView: AnyView(SwiftUIView(action: close)))
        //self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    /// Close the Share Extension
    func close() {
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}
#endif
