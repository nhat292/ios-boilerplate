//
//  UIScrollViewExtensions.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import UIKit

public extension UIScrollView {
    public var isOverflowVertical: Bool {
        return contentSize.height > frame.height && frame.height > 0
    }

    public func isReachedBottom(withTolerance tolerance: CGFloat = 0) -> Bool {
        guard isOverflowVertical else { return false }
        let contentOffsetBottom = contentOffset.y + frame.height
        return contentOffsetBottom >= contentSize.height - tolerance
    }

    public func scrollToBottom(animated: Bool) {
        guard isOverflowVertical else { return }
        let targetY = contentSize.height + contentInset.bottom - frame.height
        let targetOffset = CGPoint(x: 0, y: targetY)
        setContentOffset(targetOffset, animated: true)
    }
}
