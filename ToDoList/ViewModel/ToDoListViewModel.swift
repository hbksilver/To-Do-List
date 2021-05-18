//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//


import Foundation

class TodoListViewModel {
    var todos = [Todo]()
    var count: Int {
        return todos.count
    }
    
    init() {
        self.refreshData()
    }
    
    func todoAtIndex(_ index: Int) -> Todo {
        return todos[index]
    }
    
    func refreshData(){
        self.todos = CoreDataManager.shared.getAlltodos()
    }
    
    func completeTaskAtIndex(_ index: Int, completion: @escaping(Bool) -> Void) {
        self.refreshData()
        CoreDataManager.shared.completeTask(todo: todos[index], completion: completion)
    }
}
