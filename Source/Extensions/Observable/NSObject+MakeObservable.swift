//
//  NSObject+MakeObservable.swift
//  agora-express
//
//  Created by Gonzalo Quarin on 10/5/20.
//  Copyright © 2020 Gonzalo Quarin. All rights reserved.
//

import RxSwift

extension NSObject {
    func makeObservable<Entity>(callback: @escaping (AnyObserver<Entity>) -> Void) -> Observable<Entity> {
        return Observable.create({ observer -> Disposable in
            callback(observer)
            return Disposables.create()
        }).share()
    }
}
