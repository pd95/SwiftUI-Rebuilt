//
//  RebuiltApp.swift
//  Shared
//
//  Created by Philipp on 14.03.21.
//

import SwiftUI

@main
struct RebuiltApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
