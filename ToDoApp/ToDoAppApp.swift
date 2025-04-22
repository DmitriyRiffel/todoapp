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
        }
        .modelContainer(for: ToDoItem.self)
    }
}
