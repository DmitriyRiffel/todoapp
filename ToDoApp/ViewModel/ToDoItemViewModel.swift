//
//  ToDoItemViewModel.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import Foundation
import SwiftData


class ToDoItemViewModel: ObservableObject {
    
    private let context: ModelContext
    @Published var toDoItems: [ToDoItem] = [
        ToDoItem(title: "Title 1")
    ]
    
    init(context: ModelContext) {
        self.context = context
    }
    
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
    
    func createItem(title: String) {
        let newItem = ToDoItem(title: title)
        context.insert(newItem)
    }
}

