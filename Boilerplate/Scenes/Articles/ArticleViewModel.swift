import UIKit
import RxSwift
import RxSwiftExt
import Domain
import NetworkPlatform
import RxCocoa

struct ArticleInput {
    let loadTrigger: PublishSubject<Void>
    let loadNextTrigger: PublishSubject<Void>
}

struct ArticleOutput {
    let articles: Driver<[ArticleCellModel]>
    let loading: Driver<Bool>
    let error: Driver<Error>
}

protocol ArticlePresentable {
    var input: ArticleInput { get }
    var output: ArticleOutput { get }
}

final class ArticleViewModel: ArticlePresentable {
    var input: ArticleInput
    var output: ArticleOutput
    var useCase: ArticleUseCase

    private let disposeBag = DisposeBag()

    init(useCase: ArticleUseCase = NetworkPlatform.UseCaseProvider().makeArticleUseCase()) {
        self.useCase = useCase
        self.input = ArticleInput(loadTrigger: PublishSubject<Void>(), loadNextTrigger: PublishSubject<Void>())

        let articlesRequest: (_ limit: Int, _ offset: Int) -> Observable<[Article]> = { limit, offset in
            return useCase.getTopArticles(limit: limit, offset: offset)
        }
        let paginationSource = PaginationSource(request: articlesRequest)
        self.input.loadTrigger
            .bind(to: paginationSource.refreshTrigger)
            .disposed(by: disposeBag)
        self.input.loadNextTrigger
            .bind(to: paginationSource.loadNextTrigger)
            .disposed(by: disposeBag)
        let articles = paginationSource.elements
            .map { $0.map { ArticleCellModel(article: $0) } }
            .asDriverOnErrorJustComplete()
        let loading = paginationSource.isLoading
        let error = paginationSource.error
        self.output = ArticleOutput(articles: articles, loading: loading, error: error)
    }
}
