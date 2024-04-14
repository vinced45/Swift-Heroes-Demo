//
//  File.swift
//  
//
//  Created by Vince Davis on 4/13/24.
//

import Foundation

public enum OperatingSystem {
    case macOS
    case iOS
    case tvOS
    case watchOS
    case visionOS

    #if os(macOS)
    public static let current = macOS
    #elseif os(iOS)
    public static let current = iOS
    #elseif os(tvOS)
    public static let current = tvOS
    #elseif os(watchOS)
    public static let current = watchOS
    #elseif os(visionOS)
    public static let current = visionOS
    #else
    #error("Unsupported platform")
    #endif
}
