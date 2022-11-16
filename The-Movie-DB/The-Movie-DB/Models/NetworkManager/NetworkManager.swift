//
//  NetworkManagerV2.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

typealias DataHandler<T> = ((Result<T, Error>) -> Void)?

protocol NetworkManagerProtocol {
  func sendDataRequest<T: Codable>(endPoint: EndPointType, response: T.Type, handler: DataHandler<T>)
  func invalidateSession()
}


extension NetworkManager: URLSessionDelegate {
  func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    
    if let serverTrust = challenge.protectionSpace.serverTrust {
      completionHandler(.useCredential, URLCredential(trust: serverTrust))
    }
  }
}

final class NetworkManager: NSObject, NetworkManagerProtocol {
  
  fileprivate let requestTimeout: Double = 25.0
  
  fileprivate let queue: OperationQueue = {
    $0.qualityOfService = .background
    $0.maxConcurrentOperationCount = 1
    return $0
  }(OperationQueue())
  
  fileprivate var session: URLSession?
  
  override init() {
    super.init()
    
    let configuration = URLSessionConfiguration.default
    configuration.allowsCellularAccess = true
    configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 512 * 1024 * 1024)
    session = URLSession(configuration: configuration, delegate: self, delegateQueue: queue)
  }
  
  deinit {
    print(#function)
    invalidateSession()
  }
  
  func invalidateSession() {
    session?.getTasksWithCompletionHandler({ (sessionsTasks, uploadTasks, downloadTasks) in
      sessionsTasks
        .filter { $0.state == .running }
        .forEach { $0.cancel() }
    })
    session?.invalidateAndCancel()
  }
  
  func sendDataRequest<T: Codable>(endPoint: EndPointType, response: T.Type, handler: DataHandler<T>) {
    
    if let request = buildRequestWithURL(endPoint: endPoint) {
      let task = session?.dataTask(with: request) { (data, response, error) in
        
        guard let data = data else { return }
        let decoder = JSONDecoder()
        do {
          let json = try decoder.decode(T.self, from: data)
          handler?(.success(json))
        } catch let error {
          handler?(.failure(error))
          print(error)
        }
      }
      
      task?.resume()
    }
  }
  
  fileprivate func constructURLFromEndpoints(endPoint: EndPointType) -> URL? {
    var components = URLComponents()
    components.scheme = endPoint.scheme
    components.host = endPoint.host
    components.path = endPoint.path
    
    if let queryParameters = endPoint.queryParameters {
      components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    if let url = components.url {
      return url
    }
    return nil
  }
  
  fileprivate func buildRequestWithURL(endPoint: EndPointType) -> URLRequest? {
    if let url = constructURLFromEndpoints(endPoint: endPoint) {
      var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: requestTimeout)
      request.httpMethod = endPoint.httpMethod.rawValue
      
      if let headers = endPoint.headers {
        if request.allHTTPHeaderFields == nil {
          request.allHTTPHeaderFields = [:]
        }
        request.allHTTPHeaderFields?.merge(headers, uniquingKeysWith: { (_, new) in new })
      }
    
      return request
    }
    
    return nil
  }
}


