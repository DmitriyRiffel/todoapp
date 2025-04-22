//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            Text("Tap here to create ToDo")
            Button("Create") {
                createToDo()
            }
            List {
                ForEach(toDos) { toDo in
                    Text(toDo.title)
                }
            }
        }
    }
    
    func createToDo() {
        let toDoItem = ToDoItem(title: "Buy milk")
        modelContext.insert(toDoItem)
    }
}
