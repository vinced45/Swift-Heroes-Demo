//
//  SceneDelegate.swift
//  Demo
//
//  Created by Vince Davis on 4/10/24.
//


import HeroiOS
import HeroShared

#if os(iOS)
import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        QuickActionsManager.shared.handleQaItem(type: shortcutItem.type)
        print("scene delegate with item \(shortcutItem.type)")
    }
}
#endif
