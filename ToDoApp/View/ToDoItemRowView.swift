//
//  ToDoItemRowView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI

struct ToDoItemRowView: View {
    @Binding var toDoItem: ToDoItem
    @State private var isEditing: Bool = false
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    var onCompletionToggle: () -> Void
    var body: some View {
        HStack() {
            ToggleButton(
                isCompleted: Binding(
                    get: { toDoItem.isCompleted },
                    set: { newValue in
                        // 2) Сначала обновляем значение в модели
                        toDoItem.isCompleted = newValue
                        // 3) Затем вызываем замыкание, которое «дёргает» reorderItems()
                        onCompletionToggle()
                    }
                )
            )
            VStack(alignment: .leading){
                Text(toDoItem.title)
                    .font(.headline)
                    if toDoItem.note != "" {
                        Text(toDoItem.note)
                            .font(.subheadline)
                    }
            }
            .strikethrough(toDoItem.isCompleted ? true : false)
            .foregroundStyle(toDoItem.isCompleted ? Color.gray : .primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(height: 25)
        .swipeActions {
            Button {
                isEditing.toggle()
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .tint(Color.blue)
            Button(role: .destructive) {
                toDoItemViewModel.deleteItem(toDoItem: toDoItem)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        .sheet(isPresented: $isEditing) {
            UpdateToDoView(toDoItem: $toDoItem)
        }
    }
    
    func toggleCompletion() {
        toDoItem.isCompleted.toggle()
    }
}

struct ToDoItemRow_Previews: PreviewProvider {
    static let item = ToDoItem(
        title: "Test Title",
        note: "Test Description")
    static var previews: some View {

        ToDoItemRowView(toDoItem: .constant(item), onCompletionToggle: {
            
        })
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
