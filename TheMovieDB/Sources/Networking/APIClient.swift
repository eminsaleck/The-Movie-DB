//
//  APIClient.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

protocol APIClient{

    var session: URLSession { get }

    func fetch<T: Decodable>(with request: URLRequest,
                             decode: @escaping (Decodable) -> T?,
                             completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {

    typealias JSONHandler = (Result<Decodable, APIError>) -> Void

    private func decodingTask<T: Decodable>(with request: URLRequest,
                                            decodingType: T.Type,
                                            completion: @escaping JSONHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { data, response, _ in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let genericModel = try jsonDecoder.decode(decodingType, from: data)
                completion(.success(genericModel))
            } catch {
                completion(.failure(.requestFailed))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            guard 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(APIError(response: httpResponse)))
                return
            }
            
        }
        return task
    }

    func fetch<T: Decodable>(with request: URLRequest,
                             decode: @escaping (Decodable) -> T?,
                             completion: @escaping (Result<T, APIError>) -> Void) {
        let task = decodingTask(with: request, decodingType: T.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let json):
                    if let value = decode(json) {
                        completion(.success(value))
                    } else {
                        completion(.failure(.requestFailed))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

}
