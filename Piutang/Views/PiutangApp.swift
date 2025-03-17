//
//  PiutangApp.swift
//  Piutang
//
//  Created by Pramuditha Muhammad Ikhwan on 16/03/25.
//

import SwiftUI
import SwiftData

@main
struct PiutangApp: App {
    // Initialize router in top level app
    @StateObject private var router = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            PiutangView()
                .environmentObject(router)
        }
        .modelContainer(for: Borrower.self)
    }
}
