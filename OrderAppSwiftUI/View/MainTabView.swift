//
//  ContentView.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
