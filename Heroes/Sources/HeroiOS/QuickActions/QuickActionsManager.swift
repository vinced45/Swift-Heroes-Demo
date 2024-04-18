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
        if  type == "FAQ" {
            quickAction = .faq
        } else if type == "alberto" {
            quickAction = .alberto
        }
    }
    
    public func addQuickActions() {
        #if os(iOS)
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "FAQ",
                                      localizedTitle: "Show FAQ",
                                      localizedSubtitle: "Show FAQ for Extensions",
                                      icon: UIApplicationShortcutIcon.init(systemImageName: "questionmark.app")),
            UIApplicationShortcutItem(type: "alberto",
                                      localizedTitle: "Show Alberto",
                                      localizedSubtitle: "Show Speaker Profile for Alberto",
                                      icon: UIApplicationShortcutIcon.init(systemImageName: "music.mic")),
        ]
        #endif
    }
}

public enum QuickAction: String, Hashable {
    case faq
    case alberto
}
