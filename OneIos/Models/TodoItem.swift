//
//  TodoItem.swift
//  OneIos
//
//  待办事项数据模型
//

import Foundation

struct TodoItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var note: String = ""
    var isCompleted: Bool = false
    var createdAt: Date = Date()
}
