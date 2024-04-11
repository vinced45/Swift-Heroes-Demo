//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import Observation
import UIKit

@Observable
public class QuickActionsManager {
    public static let shared = QuickActionsManager()
    public init() {}
    
    public var quickAction: QuickAction? = nil

    public func handleQaItem(_ item: UIApplicationShortcutItem) {
        print("handed quick action for item \(item.localizedTitle)")
        if item.type == "Search" {
            quickAction = .search
        } else if item.type == "Send" {
            quickAction = .bookmark
        }
    }
    
    public func addQuickActions() {
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "Search",
                                      localizedTitle: "Searhing",
                                      localizedSubtitle: "Find me",
                                      icon: UIApplicationShortcutIcon.init(type: .search)),
            UIApplicationShortcutItem(type: "Send",
                                      localizedTitle: "Send",
                                      localizedSubtitle: "Bookmark me",
                                      icon: UIApplicationShortcutIcon.init(type: .bookmark)),
        ]
    }
}

public enum QuickAction: String, Hashable {
    case search
    case bookmark
}
