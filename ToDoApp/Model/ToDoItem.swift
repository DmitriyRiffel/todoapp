//
//  Item.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import Foundation
import SwiftData

@Model
class ToDoItem: Identifiable {
    var title: String
    var note: String?
    var isCompleted: Bool = false
    var id: String
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
    
    convenience init(title: String, isCompleted: Bool) {
        self.init(title: title)
        self.isCompleted = isCompleted
    }
    
    convenience init(title: String, note: String) {
        self.init(title: title)
        self.note = note
    }
    
    convenience init(title: String, note: String, isCompleted: Bool) {
        self.init(title: title, isCompleted: isCompleted)
        self.note = note
    }
}
