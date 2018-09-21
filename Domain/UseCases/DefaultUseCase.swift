import Foundation
import RxSwift

public protocol DefaultUseCase {
    associatedtype T
    func get(id: Int) -> Observable<T>
    func getall(predicate: NSPredicate) -> Observable<[T]>
    func save(entity: T) -> Completable
    func delete(entity: T) -> Completable
}

extension DefaultUseCase {
    public func get(id: Int) -> Observable<T> {
        return Observable.empty()
    }
    public func getall(predicate: NSPredicate) -> Observable<[T]> {
        return Observable.empty()
    }
    public func save(entity: T) -> Completable {
        return Completable.empty()
    }
    public func delete(entity: T) -> Completable {
        return Completable.empty()
    }
}
