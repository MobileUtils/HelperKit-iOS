//
//  Comparable.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension Comparable {
    
    func isEquals(to item2: Self) -> Bool {
        return self ==  item2
    }
    
    func isGreaterThan(_ item2: Self) -> Bool {
        return self > item2
    }
    
    func isLessThan(_ item2: Self) -> Bool {
        return self < item2
    }
}
