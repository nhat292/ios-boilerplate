import Foundation

public protocol UseCaseProvider {
    func makeReviewCountUseCase() -> ReviewCountUseCase
    func makeArticleUseCase() -> ArticleUseCase
}
