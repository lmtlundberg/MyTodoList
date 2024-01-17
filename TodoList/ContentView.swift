//
//  ContentView.swift
//  TodoList
//
//  Created by Martin Lundberg on 2024-01-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [Todo(title: "First Task"), Todo(title: "Second Task")]
    @State var textiInput = ""
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                HStack{
                    Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
                    Text(todo.title)
                }
                .onTapGesture {
                    if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                        todos[index].isDone.toggle()
                    }
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    todos.remove(at: index)
                }
            })
            TextField("Enter new task...", text: $textiInput)
                .onSubmit {
                    todos.append(Todo(title: textiInput))
                    textiInput = ""
                }
        }
    }
}

#Preview {
    ContentView()
}
