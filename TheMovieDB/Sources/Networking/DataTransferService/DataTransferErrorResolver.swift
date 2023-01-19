//
//  DefaultDataTransferErrorResolver.swift
//  Networking
//
//  Created by Jeans Ruiz on 19/03/22.
//

import Network

public class DataTransferErrorResolver: DataTransferErrorResolverProtocol {
  public init() { }

  public func resolve(error: NetworkError) -> Error {
    return error
  }
}
