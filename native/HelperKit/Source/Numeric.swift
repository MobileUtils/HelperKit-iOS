//
//  Numeric.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension Numeric {
    
    func increase(by increment: Self = 1) -> Self {
        return self + increment
    }
    
    func decrease(by decrement: Self = 1) -> Self {
        return self - decrement
    }
}
