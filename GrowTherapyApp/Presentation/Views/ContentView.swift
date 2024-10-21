//
//  ContentView.swift
//  GrowTherapyApp
//
//  Created by Gregori Farias on 16/10/24.
//

import SwiftUI


enum Tab: String, CaseIterable {
    case house
    case message
    case gearshape
}

struct ContentView: View {
    @State private var selectedTab: Tab = .house

    var body: some View {
        TabView(selection: $selectedTab) {
            // Home Tab
            TaskListView(viewModel: TaskViewModel(taskFetcher: MockTaskFetcher()))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.house)

            // Messages Tab
            ChatView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(Tab.message)

            // Settings Tab
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(Tab.gearshape)
        }
    }
}
