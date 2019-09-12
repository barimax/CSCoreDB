//
//  CSDatabaseProtocol.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import Foundation
import PerfectCRUD
import PerfectMySQL

public protocol CSDatabaseProtocol {
    associatedtype Entity: CSDBEntityProtocol
    var db: Database<MySQLDatabaseConfiguration> { get set }
    var table: Table<Entity, Database<MySQLDatabaseConfiguration>> { get }
    func getAll() throws -> [Entity]
    func get(id: Int) throws -> Entity
    func save(entity: Entity) throws -> Entity
    func delete(entityId id: Int) throws
    
    init()
}
extension CSDatabaseProtocol {
    var table: Table<Entity, Database<MySQLDatabaseConfiguration>> {
        return db.table(Entity.self)
    }
}

