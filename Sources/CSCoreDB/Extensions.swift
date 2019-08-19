//
//  Extensions.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

extension Database {
    struct LastID: Codable {
        var id: Int
    }
    func lastInsertedId() throws -> Int? {
        let queryResult: [LastID] = try self.sql("SELECT CAST(LAST_INSERT_ID() as SIGNED) as id", LastID.self)
        if queryResult.count > 0 {
            return queryResult[0].id
        }
        return nil
    }
}
