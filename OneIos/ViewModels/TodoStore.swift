//
//  TodoStore.swift
//  OneIos
//
//  待办事项状态管理 + UserDefaults 本地持久化
//

import Foundation
import Combine

final class TodoStore: ObservableObject {
    @Published private(set) var items: [TodoItem] = [] {
        didSet { save() }
    }

    private let saveKey = "todo_items"

    init() {
        load()
    }

    // MARK: - 增删改查

    func add(title: String, note: String = "") {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        items.insert(TodoItem(title: trimmed, note: note), at: 0)
    }

    func toggle(_ item: TodoItem) {
        guard let index = items.firstIndex(of: item) else { return }
        items[index].isCompleted.toggle()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }

    // MARK: - 持久化

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) else {
            return
        }
        items = decoded
    }

    private func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: saveKey)
    }
}
