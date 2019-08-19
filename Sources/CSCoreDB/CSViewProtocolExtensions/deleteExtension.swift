//
//  deleteExtension.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

extension CSViewProtocol {
    public func delete(entityId id: Int) throws {
        try table.where(\Entity.id == id).delete()
    }
}
