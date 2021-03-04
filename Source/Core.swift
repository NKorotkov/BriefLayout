import UIKit

infix operator =>: MultiplicationPrecedence

public extension NSLayoutConstraint {
    func activated() -> Self {
        isActive = true
        return self
    }
    
    @discardableResult
    static func +(lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        lhs.constant += rhs
        return lhs
    }
    
    @discardableResult
    static func -(lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint {
        lhs.constant -= rhs
        return lhs
    }
}

public extension NSLayoutXAxisAnchor {
    @discardableResult
    static func =>(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs).activated()
    }
}

public extension NSLayoutYAxisAnchor {
    @discardableResult
    static func =>(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs).activated()
    }
}

public extension NSLayoutDimension {
    @discardableResult
    static func =>(lhs: NSLayoutDimension, rhs: NSLayoutDimension) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs).activated()
    }
    
    @discardableResult
    static func =>(lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(equalToConstant: rhs).activated()
    }
}

/// Priority not implemented yet. Proably not needed at all.

//infix operator =%: AdditionPrecedence
//
//public extension NSLayoutConstraint {
//    @discardableResult
//    static func =%(lhs: NSLayoutConstraint, rhs: Float) -> NSLayoutConstraint {
//        lhs.priority = UILayoutPriority(rhs)
//        return lhs
//    }
//}

