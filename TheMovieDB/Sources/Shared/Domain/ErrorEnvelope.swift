//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Network

public struct ErrorEnvelope {
  public let errorMessages: [String]
  public let apiCode: TodayCode?
  public let transferError: DataTransferError?

  public init(
    errorMessages: [String] = [],
    apiCode: TodayCode? = nil,
    transferError: DataTransferError? = nil
  ) {
    self.errorMessages = errorMessages
    self.apiCode = apiCode
    self.transferError = transferError
  }

  public enum TodayCode: String {
    case MappingFailed = "mapping_failed"
    case TransferError = "transfer_error"
  }
}

extension ErrorEnvelope: Error { }
