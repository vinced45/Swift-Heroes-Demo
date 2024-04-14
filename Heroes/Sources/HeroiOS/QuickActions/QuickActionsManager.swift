//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import Observation

#if os(iOS)
import UIKit
#endif

@Observable
public class QuickActionsManager {
    public static let shared = QuickActionsManager()
    public init() {}
    
    public var quickAction: QuickAction? = nil

    public func handleQaItem(type: String) {
        if  type == "Search" {
            quickAction = .search
        } else if type == "Send" {
            quickAction = .bookmark
        }
    }
    
    public func addQuickActions() {
        #if os(iOS)
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
        #endif
    }
}

public enum QuickAction: String, Hashable {
    case search
    case bookmark
}
