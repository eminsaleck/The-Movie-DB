//
//  DomainConvertible.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

protocol DomainConvertible {

    associatedtype Domain

    func asDomain() -> Domain

}
