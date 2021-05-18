//
//  Todo+CoreDataProperties.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var completedDate: Date?
    @NSManaged public var dueDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}

extension Todo : Identifiable {

}
