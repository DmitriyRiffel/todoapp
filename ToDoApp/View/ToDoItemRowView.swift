//
//  ToDoItemRowView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI

struct ToDoItemRowView: View {
    @Binding var toDoItem: ToDoItem
    
    var body: some View {
        HStack() {
            Button {
                withAnimation {
                    toggleCompletion()
                }
            } label: {
                Image(systemName: toDoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(toDoItem.isCompleted ? Color.green : Color.red)
            }
            VStack(alignment: .leading){
                Text(toDoItem.title)
                    .font(.headline)
                if let note = toDoItem.note {
                    if note != "" {
                        Text(note)
                            .font(.subheadline)
                    }
                }
            }
            .strikethrough(toDoItem.isCompleted ? true : false)
            .foregroundStyle(toDoItem.isCompleted ? Color.gray : .primary)
            Spacer()
        }
    }
    
    func toggleCompletion() {
        toDoItem.isCompleted.toggle()
    }
}

struct ToDoItemRowView_Provider: PreviewProvider {
    static var previews: some View {
        ToDoItemRowView(toDoItem: .constant(ToDoItem(title:"Test with Note", isCompleted: true)))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
