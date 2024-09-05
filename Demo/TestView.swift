//
//  TestView.swift
//  Demo
//
//  Created by Vince Davis on 9/5/24.
//

import SwiftUI
import Macros
//import SwiftSyntaxMacros
import SFSymbolsMacro

@SFSymbol
enum Symbols: String {
  case globe
  case circleFill = "circle.fill"
}
@NavigationTitle("Cool")
struct UserProfileView: View {
    @State private var name: String = ""
    @State private var age: Int = 0
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Stepper("Age: \(age)", value: $age)
        }

    }
}
