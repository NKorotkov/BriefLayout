//
//  Helpers.swift
//  MyLovelyPodTest
//
//  Created by KOROTKOV Nikolay on 02.06.2020.
//

import UIKit

public extension UIView {
    var top: NSLayoutYAxisAnchor { topAnchor }
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }
    var left: NSLayoutXAxisAnchor { leftAnchor }
    var right: NSLayoutXAxisAnchor { rightAnchor }
    var height: NSLayoutDimension { heightAnchor }
    var width: NSLayoutDimension { widthAnchor }
    var centerY: NSLayoutYAxisAnchor { centerYAnchor }
    var centerX: NSLayoutXAxisAnchor { centerXAnchor }
}

public extension UIView {
    func forAutolayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func placedOn(_ parent: UIView) -> Self {
        parent.addSubview(self.forAutolayout())
        return self
    }
    
    func pinToCenter(of view: UIView) {
        self.centerX => view.centerX
        self.centerY => view.centerY
    }
}
