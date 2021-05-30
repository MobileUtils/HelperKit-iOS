//
//  UIAlertController.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 30/05/21.
//

import Foundation
import UIKit

public extension UIAlertController {
    
    static func showActionsheet(title: String?, message: String?, actions: [(String, UIAlertAction.Style)], selectedTitle :String, completion: @escaping (_ index: Int,_ title:String) -> Void) {
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index,title)
            }
            if title == selectedTitle{
                alertAction.setValue(true, forKey: "checked")
            }
            alertViewController.addAction(alertAction)
        }
        
        alertViewController.presentController()
    }
}

public extension UIAlertController {
    
    static func showAlertController(title: String? = nil, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ option:String) -> Void) -> Void {
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        actions.forEach { (text, actionStyle) in
            
            let action = UIAlertAction(title: text, style: actionStyle) { (action) in
                completion(action.title.safelyUnwrap)
            }
            alertViewController.addAction(action)
        }
        
        alertViewController.presentController()
    }
}
