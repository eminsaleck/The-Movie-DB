//
//  ConfigurationRemoteDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol ConfigurationRemoteDataSourceProtocol {

    func getConfiguration(completion: @escaping (Result<Configuration, Error>) -> Void)

}
