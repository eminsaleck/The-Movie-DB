//
//  DomainConvertible.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

protocol DomainConvertible {

    associatedtype Domain

    func asDomain() -> Domain

}
