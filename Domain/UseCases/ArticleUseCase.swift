import RxSwift

public protocol ArticleUseCase {
    func getTopArticles(limit: Int, offset: Int) -> Observable<[Article]>
}
