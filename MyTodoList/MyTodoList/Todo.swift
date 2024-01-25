//
//  Todo.swift
//  MyTodoList
//
//  Created by t2023-m0026 on 12/18/23.
//

import Foundation

// 각 Section의 title과 Todo를 배열로 가지는 struct 생성
struct Category : Codable {
    var header : String? = nil
    var items : [Todo] = []
}

// Todo라는 struct를 생성. String타입의 title과 Boolean타입의 isCompleted를 선언
struct Todo: Codable {
    var title : String = ""
    var isCompleted : Bool = false
}
