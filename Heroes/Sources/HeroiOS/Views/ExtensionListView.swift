//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI
import HeroShared

public struct ExtensionListView: View {
    @Environment(ScreenManager.self) var screenManager: ScreenManager
    //@Bindable var screenManager: ScreenManager
    //@Environment(QuickActionsManager.self) var quickActionsManager: QuickActionsManager
    @State var quickActionsManager = QuickActionsManager.shared
    @State private var isSheetPresented = false
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            List(ExtensionItem.all) { item in
                HStack {
                    Label(title: {
                        Text(item.name)
                    }, icon: {
                        item.image.styled()
                    })
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.heroOrange.opacity(0.3))
                            .cornerRadius(10)
                            
                        
                        HStack(spacing: 2) {
                            Image(systemName: "iphone")
                            Image(systemName: "applewatch")
                            Image(systemName: "ipad")
                            Image(systemName: "macbook")
                            Image(systemName: "appletv")
                            Image(systemName: "visionpro")
                        }
                    }
                    .frame(width: 150, height: 30)
                }
            }
            .customListStyle()
            .navigationTitle("Extensions")
            .customToolBarStyle()
            .externalScreenToolbar(screenManager: screenManager, showingSheet: $isSheetPresented)
        }
        .sheet(isPresented: $isSheetPresented) {
            Text("Half screen content here")
               .presentationDetents([.fraction(0.33), .medium])
         }
        .userActivity(activityType, element: "1", { element, activity in
            let bundleid = Bundle.main.bundleIdentifier ?? ""
                        
            activity.addUserInfoEntries(from: ["id": "1",
                                               "name": "Alex",
                                               "setby": bundleid])
            //activity.el
            logUserActivity(activity, label: "Activity")
        })
        .onContinueUserActivity(activityType, perform: { userActivity in
            if let _ = userActivity.userInfo?["id"] as? String {
                // Load handoff page

            }
            
            logUserActivity(userActivity, label: "on activity")
        })
        .onChange(of: quickActionsManager.quickAction) { _, _ in
            print("Change current action is \(String(describing: quickActionsManager.quickAction?.rawValue))")
        }
        .onChange(of: screenManager.showScreen) { _, newValue in
            isSheetPresented = newValue
        }
        .onAppear {
            print("current action is \(String(describing: quickActionsManager.quickAction?.rawValue))")
        }
    }
    
    func logUserActivity(_ activity: NSUserActivity, label: String = "") {
        print("\(label) TYPE = \(activity.activityType)")
        print("\(label) INFO = \(activity.userInfo ?? [:])")
    }
}

#Preview {
    ExtensionListView()
        .environment(ScreenManager())
}
