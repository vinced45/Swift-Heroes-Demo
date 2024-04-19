//
//  MainView.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI
import HeroShared
#if os(iOS)
import CoreSpotlight
#endif

public struct MainView: View {
    public init() {}
    
    @State var screenManager = ScreenManager()
    @State var quickActionsManager = QuickActionsManager.shared
    @State private var isSheetPresented = false
    @State var selectedItem: ListItem? = nil
    
    @State var items: [ListItem] = [.speakers, .extensions]
    
    @Namespace var namespace
    
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
//                                .matchedGeometryEffect(id: row.id,
//                                                       in: namespace,
//                                                       /*properties: .frame,
//                                                       anchor: .leading,*/
//                                                       isSource: row.id != selectedItem?.id ?? "")
                            VStack {
                                Text(row.title.wrappedValue)
                                    .font(.title3)
                                    .bold()
                                
                                Text(row.subtitle.wrappedValue)
                                    .font(.caption)
                                    .bold()
                            }
                        })
                    case .faq:
                        NavigationLink(value: row.wrappedValue, label: {
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
                    switch item.type {
                    case .speaker, .extensionItem:
                        speakerView(for: item)
                    default:
                        EmptyView()
                    }
                } else {
                    ContentUnavailableView("Nothing selected", systemImage: "cloud.fill")
                }
            }
        })
        .sheet(isPresented: $isSheetPresented) {
            ExternalScreenControlView(viewModel: screenManager)
               .presentationDetents([.fraction(0.33), .medium])
         }
        .onOpenURL { url in
            print("Received URL: \(url)")
        }
        #if os(iOS)
        .onContinueUserActivity(CSSearchableItemActionType, perform: { userActivity in
            print("Handling Spotlight item inside")
            if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String,
            let item = findItem(for: id) {
                print("Found Spotlight item")
                selectedItem = item
            }
        })
        #endif
        .onContinueUserActivity(activityType, perform: { userActivity in
            if let id = userActivity.userInfo?["id"] as? String,
               let foundItem = findItem(for: id) {
                selectedItem = foundItem
            }
            logUserActivity(userActivity, label: "on activity")
        })
        .onChange(of: quickActionsManager.quickAction) { _, _ in
            let action = quickActionsManager.quickAction?.rawValue ?? ""
            print("Change current action is \(action)")
            if  action == "share" {
                selectedItem = findItem(for: "200")
                print("share")
            }
            if action == "alberto", let item = findItem(for: "2") {
                selectedItem = item
                print("alberto")
            }
        }
        .onChange(of: screenManager.showScreen) { _, newValue in
            isSheetPresented = newValue
        }
        .onAppear {
            let action = quickActionsManager.quickAction?.rawValue ?? ""
            print("Current action is \(action)")
            if  action == "share" {
                selectedItem = findItem(for: "200")
                print("share")
            }
            if action == "alberto", let item = findItem(for: "2") {
                selectedItem = item
                print("alberto")
            }
            Task {
                let _ = await Spotlight.deIndexSpeakers()
                let _ = await Spotlight.indexSpeakers()
            }
        }
        .task {
            
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
    
    func findItem(for id: String) -> ListItem? {
        if let item = items.first?.items?.filter( { $0.id == id }).first {
            return item
        }
        
        if let item = items.last?.items?.filter( { $0.id == id }).first {
            return item
        }
        
        return nil
    }
    
    @ViewBuilder
    func speakerView(for item: ListItem) -> some View {
        VStack {
            item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            Text(item.title)
            Text(item.subtitle)
            badge(for: item.badges)
        }
        .userActivity(activityType, element: item, { element, activity in
            let bundleid = Bundle.main.bundleIdentifier ?? ""
            activity.addUserInfoEntries(from: ["id": item.id,
                                               "name": item.title,
                                               "setby": bundleid])
            logUserActivity(activity, label: "Item")
        })
    }
    
    #if os(iOS)
    func handleSpotlight(userActivity: NSUserActivity) {
        print("Handling Spotlight item")
        if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String,
        let item = findItem(for: id) {
            print("Found Spotlight item")
            selectedItem = item
        }
    }
    #endif
}

#Preview {
    MainView()
        .environment(ScreenManager())
}
