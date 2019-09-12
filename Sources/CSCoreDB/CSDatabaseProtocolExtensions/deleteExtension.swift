//
//  deleteExtension.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

extension CSDatabaseProtocol {
    public func delete(entityId id: Int) throws {
        try Self.table?.where(\Entity.id == id).delete()
    }
}
