//
//  Controller.swift
//  MyTodoList
//
//  Created by t2023-m0026 on 1/10/24.
//

import Foundation

class Controller {
    // 싱글톤 인스턴스 - 뭔지 모름
    static let shared = Controller()
    
    // private으로 초기화 메소드를 선언하여 외부에서의 인스턴스 생성을 방지 - 도 뭔지 모름
    private init() {}
    
    // 전역 변수 대신 싱글톤 내부에 categories 선언 - 도 뭔지 모름
    var categories: [Category] = []
    
    
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    
    func saveUserDefaults(category: [Category]) {
        if let encodedTodos = try? encoder.encode(category) {
            UserDefaults.standard.set(encodedTodos, forKey: "todoList")
        }
    }
    
    func readUserDefaults() {
        if let result = UserDefaults.standard.object(forKey: "todoList") as? Data, let decodedTodos = try? decoder.decode([Category].self, from: result) {
            categories = decodedTodos
        }
    }
    
    func updateCategory(_ updatedCategory: Category, updatedItem: Todo) {
        if let index = categories.firstIndex(where: { $0.header == updatedCategory.header }) {
            categories[index].header = updatedCategory.header
            if let itemIndex = categories[index].items.firstIndex(where: { $0.title == updatedItem.title }) {
                categories[index].items[itemIndex] = updatedItem
            } else {
                categories[index].items.append(updatedItem)
            }
        }
    }}
