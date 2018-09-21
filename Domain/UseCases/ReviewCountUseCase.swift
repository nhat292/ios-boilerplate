import RxSwift

public protocol ReviewCountUseCase {
    func getCount() -> Observable<LikeReviewCount>
}
