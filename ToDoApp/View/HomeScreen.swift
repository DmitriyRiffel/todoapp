//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            ForEach($toDoItemViewModel.toDoItems) { $toDo in
                ToDoItemRowView(toDoItem: $toDo)
            }
        }
    }
    
    func createToDo() {
        let toDoItem = ToDoItem(title: "Buy milk")
        modelContext.insert(toDoItem)
    }
}
