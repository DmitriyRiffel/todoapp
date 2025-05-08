//
//  CreateToDoView.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 26.04.25.
//

import SwiftUI
import Foundation

struct CreateToDoView: View {
    
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var note: String = ""
    @State private var isNotificationEnabled: Bool = false
    @State private var date = Date.now.addingTimeInterval(5 * 60)
    let dateFormatter = DateFormatter()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                TextField("Note", text: $note, axis: .vertical)
                    .lineLimit(5)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                VStack{
                    HStack {
                        Image(systemName: "calendar")
                        Toggle("Date", isOn: $isNotificationEnabled)
                    }
                    if isNotificationEnabled {
                        DatePicker("Date", selection: $date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
                Spacer()
                Button("Save") {
                    if isNotificationEnabled {
                        toDoItemViewModel.createItem(title: title, note: note, scheduledDate: date)
                    } else {
                        toDoItemViewModel.createItem(title: title, note: note)
                    }
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
                    .navigationTitle("Create TO-DO")
            }
        }
    }
}

#Preview {
    CreateToDoView()
}
