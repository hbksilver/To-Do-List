//
//  ToDoTableCell.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//

//
//  ToDoTableCell.swift
//  CoreDataPractice
//
//  Created by David on 2/23/21.
//

import Foundation
import UIKit

class ToDoTableCell: UITableViewCell{
@IBOutlet private weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDueDate: UILabel!
   @IBOutlet weak var taskCompleteDate: UILabel!
    
    var todo: Todo? {
        didSet {
            if let todo = todo{
                if todo.completed == false {
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                             todo.dueDate!.toString(format: "MM dd yyyy"))
                    taskCompleteDate.text = "To be completed"
                }else{
                    taskNameLabel.attributedText = todo.name!.strikeThrough()
                    
                    taskDueDate.attributedText = String(format: "Due on %@",
                                                        todo.dueDate!.toString(format: "MM dd yyyy")).strikeThrough()
                    taskCompleteDate.text = String(format:"Completed on %@",
                                                   todo.dueDate!.toString(format: "MM dd yyyy"))
                }
            }
        }
    }
    
    override func prepareForReuse() {
        taskNameLabel.attributedText = taskNameLabel.text!.removeAttributedText()
        taskDueDate.attributedText = taskDueDate.text!.removeAttributedText()
        taskNameLabel.text = ""
        taskDueDate.text = ""
        taskCompleteDate.text = ""
        super.prepareForReuse()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
