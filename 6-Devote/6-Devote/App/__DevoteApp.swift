//
//  __DevoteApp.swift
//  6-Devote
//
//  Created by giangbb on 15/11/2022.
//

import SwiftUI

@main
struct __DevoteApp: App {
    let persistenceController = PersistenceController.shared
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) //inject the managedObjectContext for the core data container in the whole SwiftUI app hierarchy
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
