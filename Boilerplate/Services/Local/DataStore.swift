//
//  DataStore.swift
//  Boilerplate
//
//  Created by Quyen Xuan on 3/29/18.
//  Copyright © 2018 Innovatube. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm
import RxOptional

class DataStore<T: Object> {
    static var realm: Realm {
        do {
            debugPrint(Realm.Configuration.defaultConfiguration.fileURL ?? "Realm file URL has not found")
            let realm = try Realm()

            return realm
        } catch let error {
            fatalError(String(describing: error))
        }
    }

    static var inMemoryRealm: Realm {
        do {
            let configuration = Realm.Configuration(inMemoryIdentifier: "ScoreMatchInMemoryRealm")
            let realm = try Realm(configuration: configuration)

            return realm
        } catch let error {
            fatalError(String(describing: error))
        }
    }

    class func objects(type: T.Type) -> Results<T> {
        return realm.objects(T.self)
    }

    class func first(type: T.Type, filter predicate: NSPredicate) -> T? {
        return objects(type: type, filter: predicate).first
    }

    class func objects(type: T.Type, filter predicate: NSPredicate) -> Results<T> {
        return realm.objects(T.self).filter(predicate)
    }

    class func observableObjects(type: T.Type) -> Observable<Results<T>> {
        return Observable.collection(from: realm.objects(T.self)).asObservable()
    }

    class func observableObjects(type: T.Type, filter predicate: NSPredicate) -> Observable<Results<T>> {
        return Observable.collection(from: realm.objects(T.self).filter(predicate)).asObservable()
    }

    class func write(object: Object, update: Bool = false) {
        do {
            try realm.write {
                realm.add(object, update: update)
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    class func write(objects: [Object], update: Bool = false) {
        do {
            try realm.write {
                objects.forEach { realm.add($0, update: update) }
            }
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    class func delete(object: T) {
        realm.delete(object)
    }

    class func delete(objects: RealmSwift.Results<T>) {
        realm.delete(objects)
    }

    class func delete(objects: RealmSwift.List<T>) {
        realm.delete(objects)
    }

    class func clearAllData() {
        DispatchQueue.global(qos: .background).async {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.deleteAll()
                }
            } catch {
                debugPrint(error.localizedDescription)
            }

        }
    }

    class func update( block: () throws -> Void) {
        do {
            try realm.write(block)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

}
