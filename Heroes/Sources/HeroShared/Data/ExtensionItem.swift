//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import SwiftUI

public struct ExtensionItem: Identifiable, Equatable {
    public init(id: String, name: String, desc: String, image: Image, platforms: [String]) {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
        self.platforms = platforms
    }

    public var id: String
    public var name: String
    public var desc: String
    public var image: Image
    public var platforms: [String]
}

public extension ExtensionItem {
    static var all: [ExtensionItem] {
        return [
            .init(id: "10",
                  name: "Action",
                  desc: "",
                  image: Image(systemName: "bolt.fill"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "20",
                  name: "Share",
                  desc: "",
                  image: Image(systemName: "square.and.arrow.up"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "30",
                  name: "Notification",
                  desc: "",
                  image: Image(systemName: "bell.badge.fill"),
                  platforms: [.iphone, .watch, .ipad, .mac, .xr]
                 ),
            .init(id: "40",
                  name: "iMessage",
                  desc: "",
                  image: Image(systemName: "message.fill"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "50",
                  name: "Spotlight",
                  desc: "",
                  image: Image(systemName: "magnifyingglass"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "60",
                  name: "AppClips",
                  desc: "",
                  image: Image(systemName: "appclip"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "70",
                  name: "Quick Actions",
                  desc: "",
                  image: Image(systemName: "list.bullet"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "80",
                  name: "Handoff",
                  desc: "",
                  image: Image(systemName: "macbook.and.iphone"),
                  platforms: [.iphone, .watch, .ipad, .mac, .tv, .xr]
                 ),
            .init(id: "90",
                  name: "External Screen",
                  desc: "",
                  image: Image(systemName: "tv"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "100",
                  name: "Quick Look Preview",
                  desc: "",
                  image: Image(systemName: "eye.fill"),
                  platforms: [.iphone, .ipad]
                 ),
        ]
    }
}

extension ExtensionItem: Listable {
    public var type: ListType {
        return .extensionItem
    }
    
    public var title: String {
        self.name
    }
    
    public var subtitle: String {
        self.desc
    }
    
    public var badges: [String] {
        self.platforms
    }
}
