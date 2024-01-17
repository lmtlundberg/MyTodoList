//
//  Todo.swift
//  TodoList
//
//  Created by Martin Lundberg on 2024-01-17.
//

import Foundation

struct Todo: Identifiable {
    let id = UUID().uuidString
    let title: String
    var isDone = false
}
