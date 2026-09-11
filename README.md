# OneIos — 待办事项 App

一个使用 **SwiftUI** 编写的 iOS 待办事项应用，支持 iOS 16.0+ / iPhone / iPad。

## 功能

- ➕ 添加待办事项（标题 + 可选备注）
- ✅ 点击切换完成状态（划线显示）
- 🗑 滑动删除 / 编辑模式批量删除
- ↕️ 长按拖动排序
- 💾 基于 UserDefaults 的本地持久化（JSON 编码）

## 项目结构

```
OneIos.xcodeproj/          Xcode 工程文件
OneIos/
├── OneIosApp.swift        App 入口
├── ContentView.swift      列表主页
├── Models/
│   └── TodoItem.swift     数据模型
├── ViewModels/
│   └── TodoStore.swift    状态管理 + 持久化
├── Views/
│   ├── TodoRowView.swift  列表行视图
│   └── AddTodoView.swift  新建待办页面
└── Assets.xcassets/       图标与主题色
```

## 如何运行

本项目在 Windows 上生成，需在 macOS 上构建运行：

1. 把整个项目目录复制到 Mac
2. 双击 `OneIos.xcodeproj` 用 Xcode 打开（要求 Xcode 15+）
3. 选择模拟器（如 iPhone 15），按 `Cmd + R` 运行

## 技术要点

- MVVM 架构：`TodoStore`（ObservableObject）通过 `@EnvironmentObject` 注入视图
- `NavigationStack` + `.sheet` 实现导航与弹窗
- `Codable` + `JSONEncoder` + `UserDefaults` 实现轻量本地存储

## CI/CD

本项目通过 GitHub Actions 自动构建验证（见 `.github/workflows/ios-xcodebuild.yml`）。
