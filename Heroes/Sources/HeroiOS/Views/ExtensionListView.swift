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
    #if os(iOS)
    @State var quickActionsManager = QuickActionsManager.shared
    #endif
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
            #if os(iOS)
            .listStyle(.grouped)
            #endif
            .navigationTitle("Extensions")
            .toolbarBackground(Color.heroOrange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("👓")
                        .font(.largeTitle)
                }
                #if os(iOS)
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
                #endif
            }
        }
        #if os(iOS)
        .sheet(isPresented: $isSheetPresented) {
            Text("Half screen content here")
               .presentationDetents([.fraction(0.33), .medium])
               //.interactiveDismissDisabled(true)
         }
        #endif
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
        #if os(iOS)
        .onChange(of: quickActionsManager.quickAction) { _, _ in
            print("Change current action is \(String(describing: quickActionsManager.quickAction?.rawValue))")
        }
        .onChange(of: screenManager.showScreen) { _, newValue in
            isSheetPresented = newValue
        }
        .onAppear {
            print("current action is \(String(describing: quickActionsManager.quickAction?.rawValue))")
        }
        #endif
    }
    
    func logUserActivity(_ activity: NSUserActivity, label: String = "") {
        print("\(label) TYPE = \(activity.activityType)")
        print("\(label) INFO = \(activity.userInfo ?? [:])")
    }
}

#Preview {
    ExtensionListView()
        #if os(iOS)
        .environment(ScreenManager())
        #endif
}
