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
}
