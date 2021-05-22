//
//  Optional.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public protocol Defaultable {
    static var defaultValue: Self {get}
}

public extension Optional where Wrapped: Defaultable {
    var isNil: Bool { self == nil }
    var isNotNil: Bool { self != nil }
    
    var forceWrap: Wrapped { self! }

    var safelyUnwrap: Wrapped {
        switch self {
        case .none:
            return Wrapped.defaultValue
        case .some(let nonNilValue):
            return nonNilValue
        }
    }
}

extension Int: Defaultable {
    public static var defaultValue: Int {
        return .zero
    }
}

extension CGFloat: Defaultable {
    public static var defaultValue: CGFloat {
        return .zero
    }
}

extension String: Defaultable {
    public static var defaultValue: String {
        return ""
    }
}

extension Bool: Defaultable {
    public static var defaultValue: Bool {
        return false
    }
}

extension Date: Defaultable {
    public static var defaultValue: Date {
        return Date()
    }
}


extension Double: Defaultable {
    public static var defaultValue: Double {
        return .zero
    }
}

extension CGRect: Defaultable {
    public static var defaultValue: CGRect {
        return .zero
    }
}

extension CGSize: Defaultable {
    public static var defaultValue: CGSize {
        return .zero
    }
}

extension Int16: Defaultable {
    public static var defaultValue: Int16 {
        return .zero
    }
}

extension Float: Defaultable {
    public static var defaultValue: Float {
        return .zero
    }
}

extension Character: Defaultable {
    public static var defaultValue: Character {
        return Character(.defaultValue)
    }
}

extension IndexPath: Defaultable {
    
    public static var defaultValue: IndexPath {
        return IndexPath(row: .zero, section: .zero)
    }
}

extension Array: Defaultable {
    
    public static var defaultValue: Array<Element> {
        return []
    }
}

extension NSAttributedString {
    
    public static var defaultValue: NSAttributedString {
        return "".updateAsAttributedString
    }
}

extension UIColor {
    
    public static var defaultValue: UIColor {
        return .clear
    }
}

extension CGColor {
    
    public static var defaultValue: CGColor {
        return UIColor.clear.cgColor
    }
}



public extension Optional where Wrapped == String {
    func toString() -> String {
        if let value = self {
            return "\(value)"
        }
        return ""
    }
}
public extension Optional where Wrapped == Int {
    func toInt() -> Int {
        if let value = self {
            return value
        }
        return 0
     }
}
extension Optional where Wrapped == Bool {
    func toBool() -> Bool {
        if let value = self {
            return value
        }
        return false
    }
}

extension Optional where Wrapped == CGFloat {
    func toCGFloat() -> CGFloat {
        if let value = self {
            return value
        }
        return 0
    }
}
public extension Optional where Wrapped == AnyObject {

    func toString() -> String {
        if let value = self {
            return "\(value)"
        }

        return ""
    }
    func toInt() -> Int {
        if let value = self as? Int {
            return value
        }
        return 0

    }

    func toBool() -> Bool {
        if let value = self as? Bool {
            return value
        }
        return false

    }

    func toCGFloat() -> CGFloat {
        if let value = self as? CGFloat {
            return value
        }
        return 0
    }
}


public extension Optional where Wrapped == Any {

    func toString() -> String {
        if let value = self {
            return "\(value)"
        }

        return ""
    }
    func toInt() -> Int {
        if let value = self as? Int {
            return value
        }
        return 0

    }

    func toBool() -> Bool {
        if let value = self as? Bool {
            return value
        }
        return false

    }

    func toCGFloat() -> CGFloat {
        if let value = self as? CGFloat {
            return value
        }
        return 0
    }
}
