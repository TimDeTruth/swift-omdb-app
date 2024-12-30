//
//  OMDBApiApp.swift
//  OMDBApi
//
//  Created by Timmy Lau on 2024-12-14.
//

import SwiftUI

@main
struct OMDBApiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
