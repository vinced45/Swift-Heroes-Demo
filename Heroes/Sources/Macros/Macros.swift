//
//  Macros.swift
//  Heroes
//
//  Created by Vince Davis on 9/5/24.
//

//@attached(member, names: named(debugList))
//public macro DebugList() = #externalMacro(module: "MacroMacros", type: "DebugListMacro")
//
//@attached(accessor)
//public macro LogProperty() = #externalMacro(module: "MacroMacros", type: "LogPropertyMacro")

//@attached(member, names: named(debugPrintModifier))
//public macro DebugPrint(_ properties: String...) = #externalMacro(module: "MacroMacros", type: "DebugPrintMacro")

@attached(member, names: named(body))
public macro NavigationTitle(_ title: String) = #externalMacro(module: "MacroMacros", type: "NavigationTitleMacro")
