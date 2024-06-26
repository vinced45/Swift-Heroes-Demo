//
//  ListItem.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI

public struct ListItem: Identifiable, Hashable, Listable {
    public init(id: String, title: String, subtitle: String, image: Image, badges: [String], type: ListType, items: [ListItem]? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.badges = badges
        self.type = type
        self.items = items
    }
    
    public var id: String
    public var title: String
    public var subtitle: String
    public var image: Image
    public var badges: [String]
    public var type: ListType
    public var items: [ListItem]?
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    public static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.id == rhs.id
    }
}

public extension ListItem {
    static let speakers = ListItem(id: "1000",
                                   title: "Speakers",
                                   subtitle: "Swift Hero Speakers",
                                   image: Image(systemName: "person.3.fill"),
                                   badges: [],
                                   type: .sectionHeader,
                                   items: Speaker.all.map({ ListItem(id : $0.id, title: $0.title, subtitle: $0.subtitle, image: $0.image, badges: [], type: .speaker) }))
    
    static let extensions = ListItem(id: "2000",
                                     title: "Extensions",
                                     subtitle: "Extensions covered in Talk",
                                     image: Image(systemName: "puzzlepiece.extension.fill"),
                                     badges: [],
                                     type: .sectionHeader,
                                     items: ExtensionItem.all.map({ ListItem(id : $0.id, title: $0.title, subtitle: $0.subtitle, image: $0.image, badges: $0.platforms, type: .extensionItem) }))
}
