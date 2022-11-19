//
//  RemoteDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol RemoteDataSourceProtocol {

    func configure(with apiKey: String, readAccessToken: String)
    func accountDataSource() -> AccountRemoteDataSourceProtocol
    func authDataSource() -> AuthRemoteDataSourceProtocol

}
