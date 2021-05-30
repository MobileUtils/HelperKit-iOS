//
//  UINavigationController.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 30/05/21.
//

import Foundation
import UIKit

public extension UINavigationController {
    
    func pushViewController(
        _ viewController: UIViewController,
        animated: Bool,
        completion: @escaping () -> Void) {
        pushViewController(viewController, animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }

    func popViewController(
        animated: Bool,
        completion: @escaping () -> Void) {
        popViewController(animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}

