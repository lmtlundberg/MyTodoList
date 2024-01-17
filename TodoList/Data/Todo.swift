//
//  Todo.swift
//  TodoList
//
//  Created by Martin Lundberg on 2024-01-17.
//

import Foundation

struct Todo {
    let id = UUID().uuidString
    let title: String
    let isDone = false
}
