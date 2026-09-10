//
//  OneIosApp.swift
//  OneIos
//
//  App 入口
//

import SwiftUI

@main
struct OneIosApp: App {
    @StateObject private var store = TodoStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
