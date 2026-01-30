//
//  TodoFormViewModel.swift
//  Todo
//
//  Created by admin on 30.01.2026.
//

import SwiftUI

@MainActor
final class TodoFormViewModel: ObservableObject {
    @Published var title: String
    @Published var description: String
    
    let onSave: (_ newTitle: String, _ newDescription: String) -> Void
    let onCancel: () -> Void
    
    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(task: TodoItem,
         onSave: @escaping (_ newTitle: String, _ newDescription: String) -> Void,
         onCancel: @escaping () -> Void) {
        self.title = task.title
        self.description = task.description
        self.onSave = onSave
        self.onCancel = onCancel
    }
    
    func save() {
        guard canSave else { return }
        onSave(title, description)
    }
    
    func cancel() {
        onCancel()
    }
}
