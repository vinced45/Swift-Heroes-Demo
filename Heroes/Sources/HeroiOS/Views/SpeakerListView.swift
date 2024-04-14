//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/9/24.
//

import SwiftUI
import Observation
import HeroShared

let activityType = "com.swiftheroes.speakers"

public struct SpeakerListView: View {
    @Environment(ScreenManager.self) var screenManager: ScreenManager
    //@Bindable var screenManager: ScreenManager
    //@Environment(QuickActionsManager.self) var quickActionsManager: QuickActionsManager
    @State var quickActionsManager = QuickActionsManager.shared
    @State private var isSheetPresented = false

    public init() {}
    
    public var body: some View {
        NavigationStack {
            List(Speaker.all) { speaker in
                HStack {
                    speaker.image
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text(speaker.name)
                }
            }
            .customListStyle()
            .navigationTitle("Speakers")
            .customToolBarStyle()
            .externalScreenToolbar(screenManager: screenManager, showingSheet: $isSheetPresented)
        }
        .sheet(isPresented: $isSheetPresented) {
            Text("Half screen content here")
               .presentationDetents([.fraction(0.33), .medium])
               //.interactiveDismissDisabled(true)
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
    SpeakerListView()
        #if os(iOS)
        .environment(ScreenManager())
        #endif
}
