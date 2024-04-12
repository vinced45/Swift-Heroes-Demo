//
//  SceneDelegate.swift
//  Demo
//
//  Created by Vince Davis on 4/10/24.
//

import UIKit
import HeroiOS
import HeroShared

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        QuickActionsManager.shared.handleQaItem(shortcutItem)
        print("scene delegate with item \(shortcutItem.type)")
    }
}
