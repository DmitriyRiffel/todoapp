//
//  UpdateToDoView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 01.05.25.
//

import SwiftUI
import SwiftData

struct UpdateToDoView: View {
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    @Environment(\.dismiss) private var dismiss
    @Bindable var toDoItem: ToDoItem
    
    var body: some View {
        NavigationStack{
            TextField("Title", text: $toDoItem.title)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            TextField("Note", text: $toDoItem.note, axis: .vertical)
                .lineLimit(5)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Spacer()
            Button("Edit") {
                dismiss() // here is nothing but dismiss because of the @Bindable
            }
            .disabled(toDoItem.title.isEmpty)
            .frame(maxWidth: .infinity)
            .padding()
            .background(toDoItem.title.isEmpty ? Color.green.opacity(0.7) : Color.green)
            .foregroundStyle(toDoItem.title.isEmpty ? Color.gray : Color.black)
            .cornerRadius(10)
            .padding(.horizontal)
            Spacer()
            
                .navigationTitle("Update TO-DO")
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: ToDoItem.self)
    let context = ModelContext(container)
    let viewModel = ToDoItemViewModel(context: context)
    UpdateToDoView(toDoItem: ToDoItem(title: "Test title", note: "Test note"))
        .environmentObject(viewModel)
}
