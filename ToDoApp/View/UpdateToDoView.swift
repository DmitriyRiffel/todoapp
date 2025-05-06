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
    @Binding var toDoItem: ToDoItem
    
    @State private var newTitle: String = ""
    @State private var newNote: String = ""
    
    var body: some View {
        NavigationStack{
            TextField("Title", text: $newTitle)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
                .onAppear {
                    newTitle = toDoItem.title
                }
            TextField("Note", text: $newNote, axis: .vertical)
                .lineLimit(5)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                .onAppear {
                    newNote = toDoItem.note
                }
            
            Spacer()
            Button("Edit") {
                toDoItemViewModel.updateItem(toDoItem: toDoItem, title: newTitle, note: newNote)
                dismiss()
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

//#Preview {
//    let container = try! ModelContainer(for: ToDoItem.self)
//    let context = ModelContext(container)
//    let viewModel = ToDoItemViewModel(context: context)
//    UpdateToDoView(toDoItem: ToDoItem
//        .environmentObject(viewModel)
//}
