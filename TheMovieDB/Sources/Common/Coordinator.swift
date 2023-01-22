//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UIKit

public protocol Coordinator: AnyObject {
    func start(with state: State)
    func start()
}

public extension Coordinator {
    func start(with state: State = DefaultState() ) { }
    func start() { }
}

public protocol NavigationCoordinator: Coordinator {
  var navigationController: UINavigationController { get }
}

public protocol State { }

public struct DefaultState: State {
  public init() { }
}
