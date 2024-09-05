//
//  AppDelegate+QuickActions.swift
//  Demo
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation

#if os(iOS)
import UIKit

public extension AppDelegate {
    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        if let shortcutItem = options.shortcutItem {
            print("App delegate quick action")
            
            QuickActionsManager.shared.handleQaItem(type: shortcutItem.type)
            
        }
        
        
        let sceneConfiguration = UISceneConfiguration(name: "Custom Configuration", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }
}
#endif
