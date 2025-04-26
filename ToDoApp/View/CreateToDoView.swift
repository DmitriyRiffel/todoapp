//
//  CreateToDoView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 26.04.25.
//

import SwiftUI

struct CreateToDoView: View {
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack{
            TextField("Title", text: $title)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
                .navigationTitle("Create TO-DO")
            
            Button("Save") {
                toDoItemViewModel.createItem(title: title)
                dismiss()
            }
            .disabled(title.isEmpty)
            .frame(maxWidth: .infinity)
            .padding()
            .background(title.isEmpty ? Color.green.opacity(0.7) : Color.green)
            .foregroundStyle(title.isEmpty ? Color.gray : Color.black)
            .cornerRadius(10)
            .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    CreateToDoView()
}
