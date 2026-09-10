//
//  ContentView.swift
//  OneIos
//
//  待办事项列表主页
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: TodoStore
    @State private var isShowingAdd = false

    var body: some View {
        NavigationStack {
            Group {
                if store.items.isEmpty {
                    emptyState
                } else {
                    listView
                }
            }
            .navigationTitle("待办事项")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !store.items.isEmpty {
                        EditButton()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAdd) {
                AddTodoView()
            }
        }
    }

    // MARK: - 子视图

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "checklist")
                .font(.system(size: 56))
                .foregroundColor(.secondary)
            Text("暂无待办事项")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("点击右上角 + 添加一条吧")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var listView: some View {
        List {
            ForEach(store.items) { item in
                TodoRowView(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        store.toggle(item)
                    }
            }
            .onDelete(perform: store.delete)
            .onMove(perform: store.move)
        }
        .listStyle(.insetGrouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoStore())
    }
}
