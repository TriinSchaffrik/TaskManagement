//
//  ContentView.swift
//  Todo
//
//  Created by Triin on 30.01.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = TodoListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.tasks.isEmpty {
                    ContentUnavailableView("No tasks", systemImage: "checklist", description: Text("Add your first task."))
                } else {
                    List {
                        ForEach(vm.tasks) { task in
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .font(.title)
                                    .onTapGesture {
                                        vm.toggleCompletion(id: task.id)
                                    }
                                Text(task.title)
                            }
                            .onTapGesture {
                                vm.showEditSheet(task: task)
                            }
                        }
                        .onDelete(perform: vm.deleteTask)
                        .padding(4)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        vm.showAddSheet()
                    }
                }
            }
            .sheet(item: $vm.activeSheet) { sheet in
                switch sheet {
                case .add:
                    TodoFormView(vm: TodoFormViewModel(
                        task: TodoItem(title: ""),
                        onSave: { title, description in
                            vm.addTask(title: title, description: description)
                            vm.dismissSheet()
                        },
                        onCancel: {
                            vm.dismissSheet()
                        }
                    ))
                    .presentationDetents([.medium])
                    
                case .edit(let task):
                    TodoFormView(vm: TodoFormViewModel(
                        task: task,
                        onSave: { newTitle, newDescription in
                            vm.editTask(id: task.id, newTitle: newTitle, description: newDescription)
                            vm.dismissSheet()
                        },
                        onCancel: {
                            vm.dismissSheet()
                        }
                    ))
                    .presentationDetents([.medium])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
