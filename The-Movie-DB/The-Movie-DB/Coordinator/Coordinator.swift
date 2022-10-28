//
//  Coordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
  func start()
}

extension CoordinatorProtocol {
  func coordinate(to coordinator: CoordinatorProtocol) {
    coordinator.start()
  }
}
