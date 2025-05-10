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
    let dateFormatter = DateFormatter()
    var onCompletionToggle: () -> Void
    var body: some View {
        dateFormatter.dateFormat = "d. MMM, yyy"
        dateFormatter.locale = Locale(identifier: "de_DE")
        return HStack() {
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
            .frame(height: 25)
            VStack(alignment: .leading){
                Text(toDoItem.title)
                    .font(.headline)
                if toDoItem.note != "" {
                    Text(toDoItem.note)
                        .font(.subheadline)
                }
                if toDoItem.scheduledDate != nil {
                    Text(dateFormatter.string(from: toDoItem.scheduledDate!))
                        .font(.system(size: 10))
                        .foregroundStyle(Color.date)
                }
            }
            .strikethrough(toDoItem.isCompleted ? true : false)
            .foregroundStyle(toDoItem.isCompleted ? Color.gray : .primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
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
//        note: "Test Description",
        scheduledDate: Date()
    )
    static var previews: some View {

        ToDoItemRowView(toDoItem: .constant(item), onCompletionToggle: {
            
        })
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
