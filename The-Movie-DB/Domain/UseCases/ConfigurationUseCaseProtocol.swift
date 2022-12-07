//
//  ConfigurationUseCaseProtocol.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol ConfigurationUseCaseProtocol {

    func getConfiguration(completion: @escaping (Result<Configuration, Error>) -> Void)

}
