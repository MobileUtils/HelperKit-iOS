//
//  Array.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension Array {
    
    var isNotEmpty: Bool {
        !isEmpty
    }
}

public extension Array where Element == String {
    
    func getAttributedString(fonts: [UIFont], colors: [UIColor]? = nil, offsets: [CGFloat]? = nil) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString()

        self.enumerated().forEach({ (index, value) in
            var attributes: [NSAttributedString.Key: Any]? = nil
            attributes = [NSAttributedString.Key.font: fonts[index]]

            if offsets != nil {
                attributes?[NSAttributedString.Key.baselineOffset] = offsets![index]
            }
            if colors != nil {
                attributes?[NSAttributedString.Key.foregroundColor] = colors![index]
            }
            
            attributedString.append(NSAttributedString(string: value, attributes: attributes))
        })

        return attributedString
    }

}
