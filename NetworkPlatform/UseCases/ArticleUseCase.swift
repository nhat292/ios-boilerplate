import Domain
import RxSwift

final class ArticleUseCase: Domain.ArticleUseCase {
    private let repository: ArticleRepository

    init(repository: ArticleRepository) {
        self.repository = repository
    }

    func getTopArticles(limit: Int, offset: Int) -> Observable<[Article]> {
        return repository.getTopArticles(limit: limit, offset: offset)
    }
}
