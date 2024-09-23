//
//  ContentView.swift
//  TabView
//
//  Created by PM Student on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: self.$currentTab) {
                RedView().tag(0)
                BlueView().tag(1)
                GreenView().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            TabBarView(currentTab: $currentTab)
        }
    }
}

struct TabBarItem: View {
    
    @Binding var currentTab: Int
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color.green
                        .frame(height: 2)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.easeInOut, value: currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct TabBarView: View {
    
    @Binding var currentTab: Int
    var tabBarOptions: [String] = ["Tab1", "Tab2", "Tab3"]
    
    var body: some View {
        ScrollView {
            HStack {
                ForEach(Array(zip(tabBarOptions.indices, tabBarOptions)),
                        id: \.0,
                content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab, tabBarItemName: name, tab: index)
                })
            }
        }
        .background(Color.white)
        .frame(height: 50)
    }
}

struct RedView: View {
    var body: some View {
        Color.red
            .edgesIgnoringSafeArea(.all)
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
            .edgesIgnoringSafeArea(.all)
    }
}

struct GreenView: View {
    var body: some View {
        Color.green
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
