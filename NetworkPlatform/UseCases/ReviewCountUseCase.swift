import Domain
import RxSwift

final class ReviewCountUseCase: Domain.ReviewCountUseCase {
    let repository: ReviewCountRepository

    init(repository: ReviewCountRepository) {
        self.repository = repository
    }

    func getCount() -> Observable<LikeReviewCount> {
        return repository.getCount()
    }
}
