//
//  UIScrollView+extension.swift
//  SuperApp
//
//  Created by Дмитрий Гришкин on 27.06.2024.
//

import UIKit

extension UIScrollView {

    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
        }
    }

    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        if #available(iOS 15, *) {
            setContentOffset(topOffset, animated: animated)
        } else {
            setContentOffset(topOffset, animated: false)
        }
    }
    
    func scrollToRight(animated: Bool) {
        let rightOffset = CGPoint(x: contentSize.width - bounds.size.width + contentInset.right, y: 0)
        setContentOffset(rightOffset, animated: animated)
    }
    
    func scrollToLeft(animated: Bool) {
        let leftOffset = CGPoint.zero
        setContentOffset(leftOffset, animated: animated)
    }

    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if bottomOffset.y > 0 {
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
