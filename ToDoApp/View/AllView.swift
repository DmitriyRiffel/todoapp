//
//  AllView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 28.04.25.
//

import SwiftUI
import SwiftData

struct AllView: View {
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach($toDoItemViewModel.toDoItems) { $toDo in
                    ToDoItemRowView(toDoItem: $toDo) {
                        toDoItemViewModel.reorderAllItems()
                    }
                }
                .onDelete { IndexSet in
                    for index in IndexSet {
                        toDoItemViewModel.deleteItem(toDoItem: toDoItemViewModel.toDoItems[index])
                    }
                }
            }
            .overlay(
                NavigationLink(destination: CreateToDoView()) {
                    Image(systemName: "plus.diamond")
                        .font(.system(size: 48))
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                        .padding()
                },
                alignment: .bottomTrailing
            )
            .onAppear {
                toDoItemViewModel.reorderAllItems()
            }
            .navigationTitle("All")
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: ToDoItem.self)
    let context = ModelContext(container)
    let viewModel = ToDoItemViewModel(context: context)
    AllView()
        .environmentObject(viewModel)
}
