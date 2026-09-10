//
//  AddTodoView.swift
//  OneIos
//
//  新增待办事项页面
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject private var store: TodoStore
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var note: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("标题") {
                    TextField("要做什么？", text: $title)
                }
                Section("备注（可选）") {
                    TextField("补充说明", text: $note, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle("新建待办")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        store.add(title: title, note: note)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
            .environmentObject(TodoStore())
    }
}
