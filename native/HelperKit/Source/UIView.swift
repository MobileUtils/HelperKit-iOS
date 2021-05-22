//
//  UIView.swift
//  HelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension UIView {
    static func loadFromXib<T>(withOwner: Any? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner, options: nil).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
