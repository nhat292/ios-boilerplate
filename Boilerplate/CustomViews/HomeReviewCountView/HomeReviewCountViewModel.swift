import Domain
import NetworkPlatform
import RxSwift
import RxSwiftExt

class HomeReviewCountViewModel: HomeReviewCountPresentable {
    var presentLogic: HomeReviewCountPresentLogic
    var interactLogic: HomeReviewCountInteractLogic

    private let disposeBag = DisposeBag()

    init(useCase: ReviewCountUseCase = NetworkPlatform.UseCaseProvider().makeReviewCountUseCase()) {
        let loading = ActivityIndicator()
        let error = ErrorTracker()

        interactLogic = HomeReviewCountInteractLogic(loadTrigger: PublishSubject<Void>())

        let count = interactLogic.loadTrigger.flatMapLatest {
            useCase.getCount()
                .map { result -> (likeCount: String, reviewCount: String) in
                    let formater = NumberFormatter()
                    formater.numberStyle = .decimal
                    let likeCount = formater.string(from: NSNumber(value: result.likeCount ?? 0)) ?? "0"
                    let reviewCount = formater.string(from: NSNumber(value: result.reviewCount ?? 0)) ?? "0"
                    return (likeCount: likeCount, reviewCount: reviewCount)
                }
                .trackActivity(loading)
                .trackError(error)
                .materialize()
                .elements()
            }.asDriverOnErrorJustComplete()
        presentLogic = HomeReviewCountPresentLogic(loading: loading.asDriver(), error: error.asDriver(), count: count)
    }
}
