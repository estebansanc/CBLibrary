//
//  AnyObserver+Call.swift
//  agora-express
//
//  Created by Gonzalo Quarin on 10/5/20.
//  Copyright © 2020 Gonzalo Quarin. All rights reserved.
//

import RxSwift

extension ObserverType {

    func call<Entity>(to: Observable<Entity>?, _ success: ((Entity) -> Void)? = nil) -> Disposable? {
        return to?.debug().subscribe(onNext: { auth in
            success?(auth)
        }, onError: { error in
            self.onError(error)
        })
    }
}

extension Disposable {
    func disposed(by bag: DisposeBag?) {
        bag?.insert(self)
    }
}
