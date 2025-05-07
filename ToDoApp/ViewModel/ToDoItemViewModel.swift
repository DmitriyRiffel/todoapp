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
    
    func reorderAllItems() {
        //1. Variante
//        let incompleted = toDoItems
//            .filter { !$0.isCompleted }
//            .sorted { $0.title < $1.title }
//        
//        let completed = toDoItems
//            .filter { $0.isCompleted }
//            .sorted { $0.title < $1.title }
//        toDoItems = incompleted + completed
        
        /*
         2. Variante
         Erstmal wird nach completed/incompleted sortiert in dem Vergliechen wird, ob bei lhs und rhs isCompleted gleich ist, wenn ja, dann werden sie alphabetisch sortiert.
         */
        toDoItems.sort { lhs, rhs in
            if lhs.isCompleted != rhs.isCompleted {
                return !lhs.isCompleted
            }
            return lhs.title.localizedCaseInsensitiveCompare(rhs.title) == .orderedAscending
        }
    }
    
    func fetchItems() {
        do {
            let descriptor = FetchDescriptor<ToDoItem>()
            toDoItems = try context.fetch(descriptor)
        } catch {
            print("Fetch failed")
        }
    }
    
    func deleteItem(toDoItem: ToDoItem) {
        context.delete(toDoItem)
        fetchItems()
    }
    
    func createItem(title: String, note: String) {
        var newItem: ToDoItem
        if note == "" {
            newItem = ToDoItem(title: title)
        }
        newItem = ToDoItem(title: title, note: note)
        context.insert(newItem)
        fetchItems()
    }
    
    func amountOfItems(artOfSorting: ArtOfSorting) -> Int {
        if artOfSorting == .all{
            return toDoItems.count
        } else if artOfSorting == .completed {
            let newArrayOfItems = toDoItems.filter { $0.isCompleted == true }
            return newArrayOfItems.count
        } else {
            let newArrayOfItems = toDoItems.filter { $0.isCompleted == false }
            return newArrayOfItems.count
        }
    }
    
    func updateItem(toDoItem: ToDoItem, title: String, note: String) {
        toDoItem.title = title
        toDoItem.note = note
        fetchItems()
    }
}

enum ArtOfSorting{
    case all, completed, scheduled
}

