import RxSwift
import RxCocoa
import Domain
import NetworkPlatform

struct HomeReviewCountInput {
    let loadTrigger: PublishSubject<Void>
}

struct HomeReviewCountOutput {
    let loading: Driver<Bool>
    let error: Driver<Error>
    let count: Driver<(likeCount: String, reviewCount: String)>
}

protocol HomeReviewCountPresentable {
    var input: HomeReviewCountInput { get }
    var output: HomeReviewCountOutput { get }
}

class HomeReviewCountViewModel: HomeReviewCountPresentable {
    var input: HomeReviewCountInput
    var output: HomeReviewCountOutput
    let useCase: ReviewCountUseCase

    private let disposeBag = DisposeBag()

    init(useCase: ReviewCountUseCase = NetworkPlatform.UseCaseProvider().makeReviewCountUseCase()) {
        let loading = ActivityIndicator()
        let error = ErrorTracker()
        self.useCase = useCase

        input = HomeReviewCountInput(loadTrigger: PublishSubject<Void>())

        let count = input.loadTrigger.flatMapLatest {
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
        output = HomeReviewCountOutput(loading: loading.asDriver(), error: error.asDriver(), count: count)
    }
}
