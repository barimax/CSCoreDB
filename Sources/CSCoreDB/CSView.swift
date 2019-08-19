//
//  CSView.swift
//  CS-CoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//
import Foundation
import PerfectCRUD
import PerfectMySQL

class CSBaseView<E: CSEntityProtocol>: CSViewProtocol {
    var db: Database<MySQLDatabaseConfiguration>
    var table: Table<E, Database<MySQLDatabaseConfiguration>>
    
    typealias Entity = E
    
    var entity: Entity?
    var rows: [Entity]?
    var fields: [CSPropertyDescription<Entity>] = []
    
    func json() throws -> String {
        throw CSCoreDBError.jsonDataError
    }
    
    init(dbConfiguration c: CSCoreDB?) throws {
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
        self.table = db.table(Entity.self)
    }
}

class CSView<E: CSEntityProtocol>: CSBaseView<E> {
    convenience init() throws {
        try self.init(dbConfiguration: CSCoreDBConfig.dbConfiguration)
    }
}
