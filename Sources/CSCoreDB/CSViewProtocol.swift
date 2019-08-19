//
//  CSViewProtocol.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//
import Foundation
import PerfectCRUD

public protocol CSViewProtocol: CSDatabaseProtocol {
    var singleName: String { get }
    var pluralName: String { get }
    var entity: Entity? { get set }
    var rows: [Entity]? { get set }
    var fields: [CSPropertyDescription<Entity>] { get }
    
    func json() throws -> String
    func getAll() throws -> [Entity]
    func get(id: Int) throws -> Entity
    func save(entity: Entity) throws -> Entity
    func delete(entityId id: Int) throws

}
extension CSViewProtocol {
    public var singleName: String {
        return Entity.singleName
    }
    public var pluralName: String {
        return Entity.pluralName
    }
    public var fields: [CSPropertyDescription<Entity>] {
        return Entity.refs()
    }
}
