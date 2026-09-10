//
//  TodoRowView.swift
//  OneIos
//
//  单条待办事项行视图
//

import SwiftUI

struct TodoRowView: View {
    let item: TodoItem

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title3)
                .foregroundColor(item.isCompleted ? .green : .secondary)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.body)
                    .strikethrough(item.isCompleted)
                    .foregroundColor(item.isCompleted ? .secondary : .primary)

                if !item.note.isEmpty {
                    Text(item.note)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            Text(item.createdAt, format: .dateTime.month().day())
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(item: TodoItem(title: "示例任务", note: "备注"))
            .previewLayout(.sizeThatFits)
    }
}
