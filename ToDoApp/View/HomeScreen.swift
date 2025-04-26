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
        NavigationView {
            ZStack {
                List {
                    ForEach($toDoItemViewModel.toDoItems) { $toDo in
                        ToDoItemRowView(toDoItem: $toDo)
                    }
                }
                NavigationLink(destination: CreateToDoView()) {
                    Image(systemName: "plus.diamond")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding()
                        .font(.system(size: 68))
                }
            }
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
