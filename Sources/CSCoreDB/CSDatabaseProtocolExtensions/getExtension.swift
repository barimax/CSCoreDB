//
//  getExtension.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//
import PerfectCRUD

extension CSDatabaseProtocol {
    public func getAll() throws -> [Entity] {
        return try table.select().map { $0 }
    }
    public func get(id: Int) throws -> Entity {
        guard let entity = try table.where(\Entity.id == id).first() else {
            throw CSCoreDBError.entityNotFound
        }
        return entity
    }
}
