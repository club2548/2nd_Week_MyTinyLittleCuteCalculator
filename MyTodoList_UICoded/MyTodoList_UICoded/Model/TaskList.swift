//
//  TaskList.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/11/24.
//

import Foundation

struct TaskList {
    // UserDefaults를 사용해 데이터를 저장하기 위한 싱글톤 인스턴스 생성
    private static let database = UserDefaults.standard
    // UserDefaults에서 데이터를 식별하기 위한 키를 저장하는 인스턴스 생성
    private static let key = "TaskList"
    
    // UserDefaults에서 저장된 작업목록을 디코딩하여 가져오는 메소드
    static func taskList() -> [Task] {
        if let encodedTaskList = TaskList.database.object(forKey: TaskList.key) as? Data, let taskList = try? JSONDecoder().decode([Task].self, from: encodedTaskList) {
            return taskList
        }
        // 저장된 작업 목록이 없을 경우 빈 배열 반환
        return []
    }
    
    // 작업 목록을 인코딩하여 UserDefaults에 저장하는 메서드
    static func updateTaskList(_ taskList: [Task]) {
        if let encodedTask = try? JSONEncoder().encode(taskList) {
            TaskList.database.set(encodedTask, forKey: TaskList.key)
        }
    }
    
    // '새로운 작업'을 작업 목록에 추가하는 메서드
    static func addTask(_ task: Task) {
        var taskList = Self.taskList()
        taskList.append(task)
        Self.updateTaskList(taskList)
    }
    
    // 특정 카테고리로 필터링된 작업 목록을 반환하는 메서드
    static func filterByCategory(category: TaskCategory) -> [Task] {
        return Self.taskList().filter{$0.category == category}
    }
    
    // 완료된 작업 목록을 반환하는 메서드
    static func completeList() -> [Task] {
        return Self.taskList().filter{$0.isCompleted == true}
    }
    
    // 특정 작업의 '완료 여부'를 업데이트하는 메서드
    static func completeTask(task: Task, isCompleted: Bool) {
        var list = Self.taskList()
        for index in 0 ..< list.count {
            if list[index].id == task.id {
                list[index].isCompleted = isCompleted
            }
        }
        updateTaskList(list)
    }
    
    // 특정 작업의 '카테고리'를 업데이트하는 메서드
    static func editCategory(task: Task, category: TaskCategory) {
        var list = Self.taskList()
        for index in 0 ..< list.count {
            if list[index].id == task.id {
                list[index].category = category
            }
        }
        updateTaskList(list)
    }
    
    // 특정 작업을 작업 목록에서 삭제하는 메서드
    static func deleteTask(task: Task) {
        var list = Self.taskList()
        list.removeAll(where: {$0.id == task.id})
        updateTaskList(list)
    }
}
