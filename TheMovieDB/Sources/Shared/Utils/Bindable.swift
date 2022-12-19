//
//  Bindable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

public class Bindable<T> {

    typealias Listener = ((T) -> Void)
    var listener: Listener?

    public var value: T {
        didSet {
            listener?(value)
        }
    }

    public init(_ value: T) {
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
