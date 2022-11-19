//
//  UseCasesConvertible.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

protocol UseCasesConvertible {

    associatedtype Domain

    func asDomain() -> Domain

}
