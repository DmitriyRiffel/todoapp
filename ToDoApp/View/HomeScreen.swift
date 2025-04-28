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
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {        
        NavigationStack {
            LazyVGrid(columns: columns) {
                NavigationLink(destination: ScheduledView()){
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "calendar")
                            Spacer()
                            Text("Scheduled")
                        }
                        .font(.title2)
                        Spacer()
                        Text("\(toDoItemViewModel.amountOfItems(artOfSorting: .scheduled))")
                            .font(.title)
                    }
                    .padding(10)
                    
                }
                .background(Color.yellow)
                .cornerRadius(10)
                
                NavigationLink(destination: CompletedView()){
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "checkmark")
                            Spacer()
                            Text("Completed")
                        }
                        .font(.title2)
                        Spacer()
                        Text("\(toDoItemViewModel.amountOfItems(artOfSorting: .completed))")
                            .font(.title)
                    }
                    .padding(10)
                }
                .background(Color.yellow)
                .cornerRadius(10)
                
                NavigationLink(destination: AllView()){
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "archivebox")
                            Spacer()
                            Text("All")
                        }
                        .font(.title2)
                        Spacer()
                        Text("\(toDoItemViewModel.amountOfItems(artOfSorting: .all))")
                            .font(.title)
                    }
                    .padding(10)
                }
                .background(Color.yellow)
                .cornerRadius(10)
                
            }
            .padding()
            .navigationTitle("TO-DOs")
            Spacer()
                
        }
        .overlay(
            NavigationLink(destination: CreateToDoView()) {
                Image(systemName: "plus.diamond")
                    .font(.system(size: 68))
                    .foregroundStyle(Color.blue)
                    .padding()
            },
            alignment: .bottomTrailing
        )
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
