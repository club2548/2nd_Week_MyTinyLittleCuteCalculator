//
//  TodoListItem+CoreDataProperties.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/30/24.
//
//

import Foundation
import CoreData


extension TodoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListItem> {
        return NSFetchRequest<TodoListItem>(entityName: "TodoListItem")
    }

    @NSManaged public var itemId: UUID?
    @NSManaged public var itemTitle: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var itemCreateDate: Date?
    @NSManaged public var itemIsCompleted: Bool
    @NSManaged public var itemModityDate: Date?

}

extension TodoListItem : Identifiable {

}
