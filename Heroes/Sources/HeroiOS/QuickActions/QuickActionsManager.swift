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
        if  type == "share" {
            quickAction = .share
        } else if type == "alberto" {
            quickAction = .alberto
        }
    }
    
    public func addQuickActions() {
        #if os(iOS)
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "share",
                                      localizedTitle: "Show Share",
                                      localizedSubtitle: "Show Share for Extensions",
                                      icon: UIApplicationShortcutIcon.init(systemImageName: "square.and.arrow.up")),
            UIApplicationShortcutItem(type: "alberto",
                                      localizedTitle: "Show Alberto",
                                      localizedSubtitle: "Show Speaker Profile for Alberto",
                                      icon: UIApplicationShortcutIcon.init(systemImageName: "music.mic")),
        ]
        #endif
    }
}

public enum QuickAction: String, Hashable {
    case share
    case alberto
}
