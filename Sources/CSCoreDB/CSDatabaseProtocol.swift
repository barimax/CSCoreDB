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
    associatedtype Entity: CSEntityProtocol
    var db: Database<MySQLDatabaseConfiguration> { get }
    var table: Table<Entity, Database<MySQLDatabaseConfiguration>> { get }
}

