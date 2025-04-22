//
//  ToDoItemViewModel.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import Foundation

class ToDoItemViewModel: ObservableObject {
    
    @Published var toDoItems: [ToDoItem] = [
        ToDoItem(title: "Title 1"),
        ToDoItem(title: "Title 2", isCompleted: true),
        ToDoItem(title: "Title 3")
    ]
    
    func reoderItems() {
        toDoItems.sort {lhs, rhs in
            if lhs.isCompleted == false && rhs.isCompleted == true {
                return true
            }
            return false
        }
    }
    
    func deleteItems(at indexSet: IndexSet) {
        toDoItems.remove(atOffsets: indexSet)
    }
}

