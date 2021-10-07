//
//  iDine0App.swift
//  iDine0
//
//  Created by Student on 10/4/21.
//

import SwiftUI


@main
struct iDine0App: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
