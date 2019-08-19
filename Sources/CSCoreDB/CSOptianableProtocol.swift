//
//  CSOptianableProtocol.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 19.08.19.
//

protocol CSOptionableProtocol {
    associatedtype Entity: CSEntityProtocol
    associatedtype CodableType: Codable
    var optionField: KeyPath<Entity, CodableType> { get }
}
