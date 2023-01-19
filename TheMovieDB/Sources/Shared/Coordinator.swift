//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UIKit

public protocol Coordinator: AnyObject {
    func start(with step: Step)
    func start()
}

public extension Coordinator {
    func start(with step: Step = DefaultStep() ) { }
    func start() { }
}

public protocol NavigationCoordinator: Coordinator {
  var navigationController: UINavigationController { get }
}

// MARK: - Step == State
public protocol Step { }

public struct DefaultStep: Step {
  public init() { }
}
