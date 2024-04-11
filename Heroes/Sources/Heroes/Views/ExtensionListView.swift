//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI

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
                Label(title: {
                    Text(item.name)
                }, icon: {
                    item.image.styled()
                })
            }
            .listStyle(.grouped)
            .navigationTitle("Extensions")
            .toolbarBackground(Color.heroOrange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("👓")
                        .font(.largeTitle)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if screenManager.showScreen {
                        Button(action: {
                            //screenManager.changeSpeaker()
                            isSheetPresented = true
                        }, label: {
                            Image(systemName: "airplayvideo")
                                .font(.title3)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .blue)
                                .symbolEffect(.pulse.byLayer, isActive: true)
                        })
                    }
                }
            }
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
    ExtensionListView()
        .environment(ScreenManager())
}
