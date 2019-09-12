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
    init(dbConfiguration c: CSCoreDB?) throws {
        self.init()
        var dbConfiguration: CSCoreDB
        if let uc = c {
            dbConfiguration = uc
        }else{
            dbConfiguration = CSCoreDB (
                host: "127.0.0.1",
                username: "bmserver",
                password: "B@r1m@x2016",
                database: "bmMySqlDB"
            )
        }
        self.db = try Database(
            configuration: MySQLDatabaseConfiguration(
                database: dbConfiguration.database,
                host: dbConfiguration.host,
                port: dbConfiguration.port,
                username: dbConfiguration.username,
                password: dbConfiguration.password
            )
        )
    }
}

