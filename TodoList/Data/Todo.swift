//
//  Todo.swift
//  TodoList
//
//  Created by Martin Lundberg on 2024-01-17.
//

import Foundation
import SwiftUI

struct Todo: Identifiable {
    let id = UUID().uuidString
    let title: String
    var isDone = false
    var category: Category
}

enum Category: String, CaseIterable, Identifiable{
    case sport, work, privateLife
    var id: Self {self}
    
    var color: Color {
        switch self {
        case .sport:
            return Color.gray
        case .privateLife:
            return Color.brown
        case .work:
            return Color.black
            
        }
    }
    
    var Symbol: Image {
        switch self {
        case .sport:
            return Image(systemName: "figure.soccer")
        case .work:
            return Image(systemName: "desktopcomputer")
        case .privateLife:
            return Image(systemName: "person.fill")
        }
    }
}


enum TodoSortOption {
    case all, work, privateLife, none
}

