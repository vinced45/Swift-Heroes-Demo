//
//  File.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI

public protocol Listable {
    var id: String { get }
    var title: String { get }
    var subtitle: String { get }
    var image: Image { get }
    var badges: [String] { get }
    var type: ListType { get }
}
