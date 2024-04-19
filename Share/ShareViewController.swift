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
import MobileCoreServices
import UniformTypeIdentifiers

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
        var imageFound = false
        print("share started")
        for item in self.extensionContext!.inputItems as! [NSExtensionItem] {
            for provider in item.attachments! {
                print("share looping")
                if provider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
                    // This is an image. We'll load it, then place it in our image view.
                    provider.loadItem(forTypeIdentifier: UTType.image.identifier, options: nil, completionHandler: { (imageURL, error) in
                        OperationQueue.main.addOperation {
                            if let imageURL = imageURL as? URL {
                                print("share found")
                                let image = UIImage(data: try! Data(contentsOf: imageURL))
                                let shareView = ShareView(image: image, action: self.done)
                                self.add(swiftUIView: AnyView(shareView))
                            }
                        }
                    })
                    
                    imageFound = true
                    break
                }
            }
            
            if (imageFound) {
                // We only handle one image, so stop looking for more.
                print("share donw")
                break
            }
        }
    }

    /// Close the Share Extension
    func done() {
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}
#endif

#if os(macOS)
import AppKit

class ShareViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.add(swiftUIView: AnyView(SwiftUIView(action: close)))
    }

    /// Close the Share Extension
    func close() {
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}
#endif
