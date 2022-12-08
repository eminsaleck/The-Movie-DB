//
//  LocalDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol LocalDataSourceProtocol {

    func genreDataSource() -> GenreLocalDataSourceProtocol
    func movieVisitDataSource() -> MovieVisitLocalDataSourceProtocol
    func movieSearchDataSource() -> MovieSearchLocalDataSourceProtocol
    func userDataSource() -> UserLocalDataSourceProtocol

}
