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
    static var db: Database<MySQLDatabaseConfiguration>? { get }
    static var table: Table<Entity, Database<MySQLDatabaseConfiguration>>? { get }
    func getAll() throws -> [Entity]
    func get(id: Int) throws -> Entity
    func save(entity: Entity) throws -> Entity
    func delete(entityId id: Int) throws
    
}
public extension CSDatabaseProtocol {
    public static var table: Table<Entity, Database<MySQLDatabaseConfiguration>>? {
        return Self.db?.table(Entity.self)
    }
    
    
    public static var db: Database<MySQLDatabaseConfiguration>? {
        let dbConfiguration = CSCoreDB (
            host: "127.0.0.1",
            username: "bmserver",
            password: "B@r1m@x2016",
            database: "bmMySqlDB"
        )
        return try? Database(
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

