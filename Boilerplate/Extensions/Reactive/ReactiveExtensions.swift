//
//  ReactiveExtensions.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import RxCocoa
import RxSwift

public extension Reactive where Base: UIScrollView {

    public var isReachedBottom: ControlEvent<Void> {
        let source = contentOffset
            .filter { [weak base = base] offset in
                guard let base = base else { return false }
                return base.isReachedBottom(withTolerance: base.frame.height / 2)
            }
            .map { _ in Void() }
        return ControlEvent(events: source)
    }

}
