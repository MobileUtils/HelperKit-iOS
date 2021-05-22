//
//  Color.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension UIColor {
    
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
    
    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        let rgbValue:UInt32 = 0
//        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /// Hexadecimal representation of the UIColor.
     /// For example, UIColor.blackColor() becomes "#000000".
     var hex: String {
         var red: CGFloat = 0
         var green: CGFloat = 0
         var blue: CGFloat = 0
         self.getRed(&red, green: &green, blue: &blue, alpha: nil)

         let r = Int(255.0 * red)
         let g = Int(255.0 * green)
         let b = Int(255.0 * blue)

         let str = String(format: "#%02x%02x%02x", r, g, b)
         return str
     }
}

