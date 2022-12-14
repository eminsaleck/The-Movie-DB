//
//  Endpoint.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

protocol Endpoint {

    var base: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var params: [String: Any]? { get }
    var encoding: EncondingParam { get }
    var method: HTTPMethod { get }

}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum EncondingParam {
    case defaultEncoding
    case jsonEncoding
    case compositeEncoding
}


extension Endpoint {

    var apiKey: String {
        return NetworkConfiguration.shared.apiKey
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey),
                          URLQueryItem(name: "language", value: LocalizationHelper.getCurrentLanguageCode())]
        switch encoding {
        case .defaultEncoding:
            if let params = params, method == .get {
                queryItems.append(contentsOf: params.map {
                    return URLQueryItem(name: "\($0)", value: "\($1)")
                })
            }
        case .compositeEncoding:
            if let params = params,
                let queryParams = params["query"] as? [String: Any] {
                queryItems.append(contentsOf: queryParams.map {
                    return URLQueryItem(name: "\($0)", value: "\($1)")
                })
            }
        case .jsonEncoding:
            break
        }

        components.queryItems = queryItems
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.setHeader(for: key, with: value)
            }
        }

        guard let params = params, method != .get else { return request }

        switch encoding {
        case .defaultEncoding:
            request.httpBody = params.percentEscaped().data(using: .utf8)
        case .jsonEncoding:
            request.setJSONContentType()
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        case .compositeEncoding:
            if let bodyParams = params["body"] as? [String: Any] {
                request.setJSONContentType()
                let jsonData = try? JSONSerialization.data(withJSONObject: bodyParams)
                request.httpBody = jsonData
            }
        }

        return request
    }

}
