//
//  ToggleButton´.swift
//  ToDoApp
//
//  Created by Dmitriy Riffel on 29.04.25.
//

import SwiftUI

struct ToggleButton: View {
    @Binding var isCompleted: Bool
    var body: some View {
        Button {
            withAnimation {
                isCompleted.toggle()
            }
        } label: {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(isCompleted ? Color.green : Color.red)
        }
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static let isCompleted = true
    static var previews: some View {
        ToggleButton(isCompleted: .constant(isCompleted))
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
/*
 struct ToggleButton: View {
     @Binding var isCompleted: Bool
     var body: some View {
         Button {
             withAnimation {
                 isCompleted.toggle()
             }
         } label: {
             GeometryReader { proxy in
                 ZStack {
                     Circle()
                         .stroke(lineWidth: 2.0)
                         .foregroundColor(.blue)
                     
                     if isCompleted {
                         Circle()
                             .frame(width: proxy.size.width * 0.55)
                             .foregroundStyle(Color.blue)
                     }
                 }
                 .padding(2)
             }
         }
         .scaledToFit()
         .buttonStyle(.borderless)
     }
 }

 struct ToggleButton_Previews: PreviewProvider {
     static let isCompleted = true
     static var previews: some View {
         ToggleButton(isCompleted: .constant(isCompleted))
             .previewLayout(.fixed(width: 100, height: 100))
     }
 }
 */
