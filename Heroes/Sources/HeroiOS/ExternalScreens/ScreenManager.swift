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
    
    public func changeSpeaker() {
        if let newSpeaker = Speaker.all.randomElement() {
            speaker = newSpeaker
        }
    }
}
