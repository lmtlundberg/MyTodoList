//
//  ContentView.swift
//  TodoList
//
//  Created by Martin Lundberg on 2024-01-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "Example", category: .work),
        Todo(title: "Example", category: .privateLife),
        Todo(title: "Example", category: .sport),
    ]
    
    @State var textiInput = ""
    @State private var selectedCategory: Category = .sport
    @State private var sortOption: TodoSortOption = .all

    
    var body: some View {
        
        List {
        
            Section(header: Text("New Todo")) {
                Picker("Choose Category", selection: $selectedCategory) {
                    Text("Work").tag(Category.work)
                    Text("Private").tag(Category.privateLife)
                    Text("Sport").tag(Category.sport)
                }
                .pickerStyle(MenuPickerStyle())
                TextField("Enter new todo...", text: $textiInput)
                    .onSubmit {
                        guard !textiInput.isEmpty else { return }
                        todos.append(Todo(title: textiInput, category: selectedCategory))
                        textiInput = ""
                    }
            }
            
            Section(header: Text("Sort by Category")) {
                Picker("Sort Option", selection: $sortOption) {
                    Text("All").tag(TodoSortOption.all)
                    Text("Work").tag(TodoSortOption.work)
                    Text("Private").tag(TodoSortOption.privateLife)
                    Text("Sport").tag(TodoSortOption.none)
                }
                .pickerStyle(SegmentedPickerStyle())
            }


            
            Section(header: Text("Todos")) {
                ForEach(todos.filter { todo in
                    switch sortOption {
                    case .all:
                        return true
                    case .work:
                        return todo.category == .work
                    case .privateLife:
                        return todo.category == .privateLife
                    case .none:
                        return todo.category == .sport
                    }
                }) { todo in
                    HStack{
                        
                        todo.category.Symbol
                        Divider()
                        Text(todo.title)
                            .foregroundColor(todo.category.color)
                        Spacer()
                        Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
                            .foregroundColor(todo.category.color)
                        
                    }
                    .onTapGesture {
                        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                            todos[index].isDone.toggle()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let filteredTodos = todos.filter { todo in
                            switch sortOption {
                            case .all:
                                return true
                            case .work:
                                return todo.category == .work
                            case .privateLife:
                                return todo.category == .privateLife
                            case .none:
                                return todo.category == .sport
                            }
                        }
                        
                        if index < filteredTodos.count {
                            let todoToDelete = filteredTodos[index]
                            if let deleteIndex = todos.firstIndex(where: { $0.id == todoToDelete.id }) {
                                todos.remove(at: deleteIndex)
                            }
                        }
                    }
                })
                
            }
        }
    }
}

#Preview {
    ContentView()
}
