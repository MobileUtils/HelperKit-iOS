//
//  Int.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation

public extension Int {
    
    static var one: Int {
        return 1
    }
    
    static var two: Int {
        return 2
    }
    
    static var three: Int {
        return 3
    }
    
    static var four: Int {
        return 4
    }
    
    static var five: Int {
        return 5
    }
    
    static var six: Int {
        return 6
    }
    
    static var seven: Int {
        return 7
    }
    
    static var eight: Int {
        return 8
    }
    
    static var nine: Int {
        return 9
    }
    
    static var ten: Int {
        return 10
    }
}

public extension Int {
    
    func toString() -> String {
        return "\(self)"
    }
    
    func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }

    var isZero: Bool {
        return self == .zero
    }
    
    var leadingZero: String {
        return String(format: "%02d", self)
    }
    
    func leadingZero(count: Int = 2) -> String {
        return String(format: "%0\(count)d", self)
    }
    
    func removeIfZero() -> String {
        
        return self == .zero ? "": "\(self)"
    }
    
    func convertDurationFormat(format: String = "hh:mm:ss") -> String {
        let hour = self / 3600
        let minute = (self % 3600) / 60
        let second = (self % 3600) % 60
                
        switch format.lowercased() {
        case "hh:mm":
            return String(format: "%02d:%02d", hour, minute)

        case "mm:ss":
            return String(format: "%02d:%02d", minute, second)

        default:
            return String(format: "%02d:%02d:%02d", hour, minute, second)
        }
    }
    
    
    func convertDelimiterFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSize = 3
        numberFormatter.secondaryGroupingSize = 2
        return numberFormatter.string(from: NSNumber(value: self)) ?? .defaultValue
    }
}
