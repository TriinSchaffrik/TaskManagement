//
//  EditView.swift
//  Todo
//
//  Created by Triin on 30.01.2026.
//

import SwiftUI

struct TodoFormView: View {
    @StateObject var vm: TodoFormViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Task") {
                    TextField("Title", text: $vm.title)
                    TextField("Description", text: $vm.description, axis: .vertical)
                        .lineLimit(3...5)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        vm.save()
                    }
                    .disabled(!vm.canSave)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        vm.cancel()
                    }
                }
            }
        }
    }
}

#Preview {
    TodoFormView(vm: TodoFormViewModel(
        task: TodoItem(title: "Preview", description: "Test Description"),
        onSave: { _, _ in },
        onCancel: { }
    ))
}
