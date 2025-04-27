//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 22.04.25.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach($toDoItemViewModel.toDoItems) { $toDo in
                        ToDoItemRowView(toDoItem: $toDo)
                    }
                    .onDelete { IndexSet in
                        for index in IndexSet {
                            toDoItemViewModel.deleteItems(toDoItem: toDoItemViewModel.toDoItems[index])
                        }
                    }
                }
                .overlay(
                    NavigationLink(destination: CreateToDoView()) {
                        Image(systemName: "plus.diamond")
                            .font(.system(size: 68))
                            .padding()
                    },
                    alignment: .bottomTrailing
                )
            .navigationTitle("TO-DOs")
        }
        .onAppear(){
            toDoItemViewModel.fetchItems()
        }
    }

}

#Preview {
    let container = try! ModelContainer(for: ToDoItem.self)
    let context = ModelContext(container)
    let viewModel = ToDoItemViewModel(context: context)
    HomeScreen()
        .environmentObject(viewModel)
}
