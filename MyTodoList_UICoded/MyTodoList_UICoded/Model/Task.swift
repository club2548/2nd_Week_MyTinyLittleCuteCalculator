//
//  Task.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/11/24.
//

import Foundation

struct Task: Codable {
    var id : Int
    var title : String
    var isCompleted : Bool
    var category : TaskCategory
}

enum TaskCategory: String, CaseIterable, Codable {
    case none
    case work
    case life
    
    func toIndex() -> Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
    static func category(from index: Int) -> Self? {
        Self.allCases.indices ~= index ? Self.allCases[index] : nil
    }
}
