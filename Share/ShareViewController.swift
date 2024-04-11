//
//  ShareViewController.swift
//  Share
//
//  Created by Vince Davis on 4/7/24.
//

import UIKit
import Social
import SwiftUI
import Heroes

class ShareViewController: UIViewController/* SLComposeServiceViewController */  {

    /*
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        //preferredContentSize = CGSize(width: 320, height: 300)
        let childView = UIHostingController(rootView: SwiftUIView())
        addChild(childView)
        //childView.view.frame = view.bounds
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        childView.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        childView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        childView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        childView.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
     */
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
