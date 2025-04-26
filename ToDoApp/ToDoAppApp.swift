//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(
                    ToDoItemViewModel(context: ModelContext(modelContainer))
                )
        }
        .modelContainer(for: ToDoItem.self)
    }
    
    private var modelContainer: ModelContainer {
        do {
            return try ModelContainer(for: ToDoItem.self)
        } catch {
            fatalError("Fehler beim Initialisieren des ModelContainers: \(error)")
        }
    }
}
