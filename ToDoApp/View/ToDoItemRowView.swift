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

            Text(toDoItem.title)
                .font(.headline)
                .strikethrough(toDoItem.isCompleted ? true : false)
                .foregroundStyle(toDoItem.isCompleted ? Color.gray : .primary)
            Spacer()
        }
    }
    
    func toggleCompletion() {
        toDoItem.isCompleted.toggle()
    }
}

struct TimerCardView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemRowView(toDoItem: .constant(ToDoItem(title:"Test title", isCompleted: true)))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
