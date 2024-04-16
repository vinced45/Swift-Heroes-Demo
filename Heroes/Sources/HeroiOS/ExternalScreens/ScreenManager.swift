//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI
import Observation
import HeroShared

@Observable
public class ScreenManager {
    public init() {}
    
    public var showScreen = false
    public var speaker: Speaker = .alex
    public var selection: Int = 0
    public var speakers: [Speaker] = Speaker.all
    
    public func add() {
        selection += 1
        speaker = speakers[selection]
    }
    
    public func minus() {
        selection -= 1
        speaker = speakers[selection]
    }
}
