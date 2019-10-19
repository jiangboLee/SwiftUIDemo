//
//  TabBar.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/19.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @State var selectedView = 1
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.orange
    }
    
    var body: some View {
        TabView(selection: $selectedView) {
            Home()
                .tabItem {
                    Image("IconHome")
                    Text("Home")
            }
            .tag(1)
            ContentView()
                .tabItem {
                    Image("IconCards")
                    Text("Certificates")
            }
            .tag(2)
            Settings()
                .tabItem {
                    Image("IconSettings")
                    Text("Settings")
            }
            .tag(3)
        }
        .accentColor(.black)
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
//            .environment(\.colorScheme, .dark)
//            .environment(\.sizeCategory, .extraExtraLarge)
    }
}
