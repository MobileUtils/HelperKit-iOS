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

public extension UIView {

    func drawAppleHealth(_ ahLayer: CAShapeLayer, withRadius: CGFloat, strokeColor: CGColor, lineWidth: CGFloat) {

        let layerPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), radius: withRadius, startAngle: -(CGFloat.pi / 2), endAngle: CGFloat(Double.pi * 2), clockwise: true).cgPath
        ahLayer.fillColor = UIColor.clear.cgColor
        ahLayer.lineWidth = lineWidth
        ahLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        ahLayer.path = layerPath
        ahLayer.strokeColor = strokeColor
    }

    func animateAppleHealth(for ahtLayer: CAShapeLayer, fromValue: CGFloat, toValue: CGFloat) {

        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.duration = 0.3
        strokeAnimation.fromValue = (fromValue.isZero || fromValue.isNaN) ? -0.1 : fromValue
        strokeAnimation.toValue = (toValue.isZero || toValue.isNaN) ? -0.1 : toValue
        strokeAnimation.fillMode = CAMediaTimingFillMode.forwards
        strokeAnimation.isRemovedOnCompletion = false
        ahtLayer.add(strokeAnimation, forKey: "strokeEnd")
        self.layer.addSublayer(ahtLayer)
    }

}

public extension UIView {
    
    func applyShadow(shadowColor: UIColor, shadowRadius: CGFloat, shadowOpacity: CGFloat, shadowOffset: CGSize = CGSize.zero) {

        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowRadius = shadowRadius
        layer.zPosition = 1
    }
}
