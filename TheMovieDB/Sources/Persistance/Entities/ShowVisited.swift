//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//
import Foundation

public struct ShowVisitedDLO: Hashable {
  public let id: Int
  public let pathImage: String

  public init(id: Int, pathImage: String) {
    self.id = id
    self.pathImage = pathImage
  }
}
