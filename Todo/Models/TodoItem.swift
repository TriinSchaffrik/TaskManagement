//
//  TodoItem.swift
//  Todo
//
//  Created by Triin on 30.01.2026.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var description: String

    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, description: String = "") {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.description = description
    }
    
    func toggleCompletion() -> TodoItem {
        return TodoItem(id: self.id, title: self.title, isCompleted: !self.isCompleted, description: self.description)
    }
}
