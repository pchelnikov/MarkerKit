//
//  MarkerKit.swift
//
//  MIT License
//
//  Copyright (c) 2017 Michael Pchelnikov
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

public typealias MarkerView = UIView

public extension MarkerView {
    var mrk: MarkerConstraintView {
        return MarkerConstraintView(view: self)
    }
}

public extension MarkerConstraintView {

    //MARK: convinient extensions

    @discardableResult
    func fillSuperview(_ edges: UIEdgeInsets = UIEdgeInsets.zero, usingSafeArea: Bool = true) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        if let superview = self.view.superview {
            let superviewArea: Any = {
                guard usingSafeArea else { return superview }

                if #available(iOS 11.0, *) {
                    return superview.safeAreaLayoutGuide
                } else {
                    return superview
                }
            }()

            let topConstraint = top(to: superviewArea, constant: edges.top)
            let leadingConstraint = leading(to: superviewArea, constant: edges.left)
            let bottomConstraint = bottom(to: superviewArea, constant: -edges.bottom)
            let trailingConstraint = trailing(to: superviewArea, constant: -edges.right)

            constraints = [topConstraint, leadingConstraint, bottomConstraint, trailingConstraint]
        }

        return constraints
    }
}

public struct MarkerConstraintView {
    
    //MARK: public

    //MARK: sides
    @discardableResult
    public func leading(to view: Any?, attribute: NSLayoutConstraint.Attribute = .leading, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .leading, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }

    @discardableResult
    public func trailing(to view: Any?, attribute: NSLayoutConstraint.Attribute = .trailing, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .trailing, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func left(to view: Any?, attribute: NSLayoutConstraint.Attribute = .left, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .left, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func right(to view: Any?, attribute: NSLayoutConstraint.Attribute = .right, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .right, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }

    @discardableResult
    public func top(to view: Any?, attribute: NSLayoutConstraint.Attribute = .top, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .top, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func bottom(to view: Any?, attribute: NSLayoutConstraint.Attribute = .bottom, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .bottom, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    //MARK: centering
    @discardableResult
    public func centerX(to view: Any?, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .centerX, toView: view, attribute: .centerX, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }

    @discardableResult
    public func centerY(to view: Any?, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .centerY, toView: view, attribute: .centerY, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func center(to view: Any?) -> [NSLayoutConstraint] {
        let centerXConstraint = centerX(to: view)
        let centerYConstraint = centerY(to: view)
        let constraints = [centerXConstraint, centerYConstraint]

        return constraints
    }

    //MARK: measurement
    @discardableResult
    public func width(to view: Any?, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .width, toView: view, attribute: .width, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func width(_ constant: CGFloat) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .width, toView: nil, attribute: .width, relation: .equal, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }

    @discardableResult
    public func height(to view: Any?, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .height, toView: view, attribute: .height, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    @discardableResult
    public func height(_ constant: CGFloat) -> NSLayoutConstraint {
        let constraint = makeConstraint(attribute: .height, toView: nil, attribute: .height, relation: .equal, constant: constant)
        addConstraintToSuperview(constraint)
        return constraint
    }
    
    
    //MARK: private
    fileprivate func addConstraintToSuperview(_ constraint: NSLayoutConstraint) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.superview?.addConstraint(constraint)
    }
    
    fileprivate func makeConstraint(attribute attr1: NSLayoutConstraint.Attribute, toView: Any?, attribute attr2: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: self.view,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)
        
        return constraint
    }
    
    internal let view: MarkerView
    
    internal init(view: MarkerView) {
        self.view = view
    }
}
