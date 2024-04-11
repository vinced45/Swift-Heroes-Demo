//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
public class ScreenManager {
    public init() {}
    
    public var showScreen = false
    public var speaker: Speaker = Speaker(id: "1", name: "Alex", image: .alex)
    
    public func changeSpeaker() {
//        if let random = ["wow", "cool", "better"].randomElement() {
//            text = random
//        }
        if let newSpeaker = Speaker.all.randomElement() {
            speaker = newSpeaker
        }
    }
}
