//
//  TodoListViewModel.swift
//  Todo
//
//  Created by Triin on 30.01.2026.
//

import SwiftUI

@MainActor
final class TodoListViewModel: ObservableObject {
    @Published private(set) var tasks: [TodoItem] = []
    
    @Published var activeSheet: ActiveSheet? = nil
        
        enum ActiveSheet: Identifiable {
            case add
            case edit(TodoItem)
            
            private static let addUUID = UUID()
            
            var id: UUID {
                switch self {
                case .add: Self.addUUID
                case .edit(let task): task.id
                }
            }
        }
    
    func addTask(title: String, description: String) {
        let task = TodoItem(title: title, description: description)
        tasks.append(task)
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func editTask(id: UUID, newTitle: String, description: String) {
        guard let index = tasks.firstIndex(where: {$0.id == id}) else {return}
        tasks[index].title = newTitle
        tasks[index].description = description
    }
    
    func toggleCompletion(id: UUID) {
        guard let index = tasks.firstIndex(where: {$0.id == id}) else {return}
        tasks[index].isCompleted.toggle()
    }
    
    func showAddSheet() {
        activeSheet = .add
    }
    
    func showEditSheet(task: TodoItem) {
        activeSheet = .edit(task)
    }
    
    func dismissSheet() {
        activeSheet = nil
    }
}
