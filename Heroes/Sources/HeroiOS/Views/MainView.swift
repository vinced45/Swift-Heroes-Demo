//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI
import HeroShared

public struct MainView: View {
    public init() {}
    
    @State var screenManager = ScreenManager()
    @State var quickActionsManager = QuickActionsManager.shared
    @State private var isSheetPresented = false
    @State var selectedItem: ListItem? = nil
    
    @State var items: [ListItem] = [.speakers, .extensions]
    
    public var body: some View {
        #if os(tvOS)
        tvMainView
        #else
        mainView
            .environment(screenManager)
            .externalScreen($screenManager.showScreen) {
                ExternalScreenView()
                    .environment(screenManager)
            }
        #endif
    }
    
    @ViewBuilder
    func badge(for items: [String]) -> some View {
        if !items.isEmpty {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.heroOrange.opacity(0.3))
                    .cornerRadius(10)
                
                HStack(spacing: 2) {
                    ForEach(items, id: \.self) { image in
                        Image(systemName: image)
                    }
                }
            }
            .frame(width: 150, height: 30)
        }
    }
    
    #if !os(tvOS)
    @ViewBuilder
    var mainView: some View {
        NavigationSplitView(sidebar: {
            List($items, children: \.items, selection: $selectedItem) { row in
                HStack {
                    switch row.type.wrappedValue {
                    case .sectionHeader:
                        row.image.wrappedValue
                            .font(.title)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.heroOrange, Color.heroBlue)
                            .padding(.horizontal)
                        VStack(spacing: 1) {
                            Text(row.title.wrappedValue)
                                .font(.title)
                                .bold()
                            Text(row.subtitle.wrappedValue)
                                .font(.caption)
                        }
                    case .extensionItem:
                        NavigationLink(value: row.wrappedValue, label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    row.image.wrappedValue.styled()
                                    Text(row.title.wrappedValue)
                                        .font(.title3)
                                        .bold()
                                    Spacer()
                                }
                                badge(for: row.badges.wrappedValue)
                            }
                        })
                    case .speaker:
                        NavigationLink(value: row.wrappedValue, label: {
                            row.image.wrappedValue
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10.0)
                            VStack {
                                Text(row.title.wrappedValue)
                                    .font(.title3)
                                    .bold()
                                
                                Text(row.subtitle.wrappedValue)
                                    .font(.caption)
                                    .bold()
                            }
                        })
                    }
                }
            }
            .customListStyle()
            .navigationTitle("Swift Heroes")
            .customToolBarStyle()
            .externalScreenToolbar(screenManager: screenManager, showingSheet: $isSheetPresented)
        }, detail: {
            VStack {
                if let item = selectedItem {
                    VStack {
                        item.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                        
                        Text(item.title)
                        Text(item.subtitle)
                        badge(for: item.badges)
                    }
                } else {
                    ContentUnavailableView("Nothing selected", image: "")
                }
            }
        })
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
    #endif
    
    @ViewBuilder
    var tvMainView: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                content:  {
            SpeakerListView()
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                .tabItem {
                    Label("Speakers", systemImage: "person.3.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.heroOrange, Color.heroBlue)
            }.tag(1)
            
            ExtensionListView()
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                .tabItem {
                Label("Extensions", systemImage: "puzzlepiece.extension.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.heroOrange, Color.heroBlue)
            }.tag(2)
        })
    }
    
    func logUserActivity(_ activity: NSUserActivity, label: String = "") {
        print("\(label) TYPE = \(activity.activityType)")
        print("\(label) INFO = \(activity.userInfo ?? [:])")
    }
}

#Preview {
    MainView()
        .environment(ScreenManager())
}
