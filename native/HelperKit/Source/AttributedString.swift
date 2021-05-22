//
//  AttributedString.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension NSMutableAttributedString {

     func addLetterSpacing(space: Double) {
        self.addAttribute(NSAttributedString.Key.kern, value: space, range: NSRange(location: 0, length: self.length))
    }
    
    func addLineSpacing(space: CGFloat) -> Void {

           let style = NSMutableParagraphStyle()
           style.lineSpacing = 4
           
           self.addAttributes([NSAttributedString.Key.paragraphStyle: style], range: ((self.string as NSString).range(of: self.string)))
    }
}
