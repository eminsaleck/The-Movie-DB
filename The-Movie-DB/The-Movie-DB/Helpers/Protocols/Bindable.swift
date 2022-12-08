//
//  Bindable.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 25.11.2022.
//

import Foundation

class Bindable<T> {

    typealias Listener = ((T) -> Void)
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

}
