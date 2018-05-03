import RxCocoa
import RxSwift

public extension Reactive where Base: UIScrollView {

    public var isReachedBottom: ControlEvent<Void> {
        let source = contentOffset
            .filter { [weak base = base] _ in
                guard let base = base else { return false }
                return base.isReachedBottom(withTolerance: base.frame.height / 2)
            }
            .map { _ in Void() }
        return ControlEvent(events: source)
    }

}
