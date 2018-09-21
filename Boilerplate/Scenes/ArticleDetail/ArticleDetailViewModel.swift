import Domain
import NetworkPlatform
import RxSwift
import RxSwift
import RxCocoa
import RxSwiftExt

struct ArticleDetailOutput {
    let loading: Driver<Bool>
    let error: Driver<Error>
    let article: ArticleCellModel
}

struct ArticleDetailInput {
    let loadTrigger: PublishSubject<Void>
}

protocol ArticleDetailPresentable {
    var input: ArticleDetailInput { get }
    var output: ArticleDetailOutput { get }
}

final class ArticleDetailViewModel: ArticleDetailPresentable {
    var input: ArticleDetailInput
    var output: ArticleDetailOutput

    private let disposeBag = DisposeBag()

    init(article: ArticleCellModel?) {
        let loading = ActivityIndicator()
        let error = ErrorTracker()

        input = ArticleDetailInput(loadTrigger: PublishSubject<Void>())

        let safeArticle: ArticleCellModel
        if let article = article {
            safeArticle = article
        } else {
            safeArticle = ArticleCellModel.dummyArticle()
        }
        output = ArticleDetailOutput(loading: loading.asDriver(), error: error.asDriver(), article: safeArticle)
    }

}
