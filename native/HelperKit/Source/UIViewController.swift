//
//  UIViewController.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 30/05/21.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func presentController() -> Void {
        UIApplication.getTopController()?.present(self, animated: true, completion: nil)
    }
    
    func pushController() -> Void {
        UIApplication.getTopController()?.navigationController?.pushViewController(self, animated: true)
    }
}
