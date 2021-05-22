import UIKit

public extension UIView {

    @discardableResult func g_pin(on type1: NSLayoutConstraint.Attribute,
                                  view: UIView? = nil, on type2: NSLayoutConstraint.Attribute? = nil,
             constant: CGFloat = 0,
             priority: Float? = nil) -> NSLayoutConstraint? {
    guard let view = view ?? superview else {
      return nil
    }

    translatesAutoresizingMaskIntoConstraints = false
    let type2 = type2 ?? type1
    let constraint = NSLayoutConstraint(item: self, attribute: type1,
                                        relatedBy: .equal,
                                        toItem: view, attribute: type2,
                                        multiplier: 1, constant: constant)
    if let priority = priority {
        constraint.priority = UILayoutPriority.init(priority)
    }

    constraint.isActive = true

    return constraint
  }

  func g_pinEdges(view: UIView? = nil) {
    g_pin(on: .top, view: view)
    g_pin(on: .bottom, view: view)
    g_pin(on: .left, view: view)
    g_pin(on: .right, view: view)
  }

  func g_pin(size: CGSize) {
    g_pin(width: size.width)
    g_pin(height: size.height)
  }

   @discardableResult func g_pin(width: CGFloat) -> NSLayoutConstraint?{
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
        addConstraint(constraint)
        return constraint
    }

  @discardableResult func g_pin(height: CGFloat) -> NSLayoutConstraint? {
    translatesAutoresizingMaskIntoConstraints = false
    let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
    addConstraint(constraint)
    return constraint
  }
  
  func g_pin(greaterThanHeight height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
  }

  func g_pinHorizontally(view: UIView? = nil, padding: CGFloat) {
    g_pin(on: .left, view: view, constant: padding)
    g_pin(on: .right, view: view, constant: -padding)
  }

  func g_pinUpward(view: UIView? = nil) {
    g_pin(on: .top, view: view)
    g_pin(on: .left, view: view)
    g_pin(on: .right, view: view)
  }

  func g_pinDownward(view: UIView? = nil) {
    g_pin(on: .bottom, view: view)
    g_pin(on: .left, view: view)
    g_pin(on: .right, view: view)
  }

  func g_pinCenter(view: UIView? = nil) {
    g_pin(on: .centerX, view: view)
    g_pin(on: .centerY, view: view)
  }
}

public extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    @discardableResult public func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
