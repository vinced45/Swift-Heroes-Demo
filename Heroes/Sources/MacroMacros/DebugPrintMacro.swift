//
//  DebugPrintMacro.swift
//  Heroes
//
//  Created by Vince Davis on 9/5/24.
//

//import SwiftCompilerPlugin
//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftSyntaxMacros
//
//public struct DebugPrintMacro: MemberMacro {
//    public static func expansion(
//        of node: AttributeSyntax,
//        providingMembersOf declaration: some DeclGroupSyntax,
//        in context: some MacroExpansionContext
//    ) throws -> [DeclSyntax] {
//        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
//            throw MacroError.notAStruct
//        }
//
//        let properties = node.arguments?.as(LabeledExprListSyntax.self)?.map { $0.expression.description } ?? []
//        
//        let propertyChecks = properties.map { property in
//            """
//            if !properties.contains("\(property)") {
//                fatalError("Property '\(property)' is not defined in the view.")
//            }
//            """
//        }.joined(separator: "\n")
//
//        let propertyPrints = properties.map { property in
//            "print(\"\\($0): \\(String(describing: self.\(property)))\")"
//        }.joined(separator: "\n            ")
//
//        let modifierCode = """
//        func debugPrintModifier() -> some View {
//            let properties = Set<String>(Mirror(reflecting: self).children.compactMap { $0.label })
//            \(propertyChecks)
//            return self.modifier(DebugPrintModifier(action: {
//                print("Debug Print for \\(String(describing: Self.self)):")
//                \(propertyPrints)
//            }))
//        }
//        """
//
//        return [DeclSyntax(stringLiteral: modifierCode)]
//    }
//}
//
//public enum MacroError: Error {
//    case notAStruct
//}
