//
//  ToDoListController.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//

import Foundation
import UIKit
import CoreData


class ToDoListController: UIViewController {
    
    var vm = TodoListViewModel()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 44
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm.refreshData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableview.reloadData()
    }
}
extension ToDoListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! ToDoTableCell
        cell.todo = vm.todoAtIndex(indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = vm.todoAtIndex(indexPath.row)
        tableview.deselectRow(at: indexPath, animated: true)
        
        if todo.completed == false {
            let alertController = UIAlertController(title: "Completed?", message: "Mark this task as completed?", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"YES", style:.default, handler:{
 (_) in
                self.vm.completeTaskAtIndex(indexPath.row) { (_) in
                    self.tableview.reloadData()
                }
            } ))
            alertController.addAction(UIAlertAction(title:"NO", style:.default, handler:nil))
            present(alertController, animated:true)
        }
        
        
        
    }
    
    
}
