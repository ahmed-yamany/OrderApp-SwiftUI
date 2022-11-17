//
//  OrderAppSwiftUIApp.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

@main
struct OrderAppSwiftUIApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(order)
        }
    }
}
