//
//  Binding.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import Foundation

class Binding<T> {
    typealias Handler = (T) -> Void
    
    public var value: T {
        didSet {
            handler?(value)
        }
    }
    
    private var handler: Handler?
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(_ handler: Handler?) {
        handler?(value)
        self.handler = handler
    }
}
