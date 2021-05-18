//
//  Date+Extentions.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}



