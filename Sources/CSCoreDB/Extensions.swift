//
//  Extensions.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

public extension Database {
    struct LastID: Codable {
        var id: UInt64
    }
    func lastInsertedId() throws -> UInt64? {
        let queryResult: [LastID] = try self.sql("SELECT CAST(LAST_INSERT_ID() as UNSIGNED) as id", LastID.self)
        if queryResult.count > 0 {
            return queryResult[0].id
        }
        return nil
    }
}
