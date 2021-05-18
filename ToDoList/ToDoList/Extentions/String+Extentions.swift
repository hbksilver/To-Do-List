//
//  String+Extentions.swift
//  ToDoList
//
//  Created by hassan Baraka on 4/28/21.
//

import Foundation

extension String {
    func strikeThrough() -> NSAttributedString {
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        
        attrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: _NSRange(location: 0, length: attrString.length))
        return attrString
    }
    
    func removeAttributedText() -> NSAttributedString{
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attrString.setAttributes([:]
, range: NSRange(location: 0, length: attrString.length))
        return attrString
    }
    
}
