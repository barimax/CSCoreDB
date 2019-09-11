//
//  getExtension.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//
import PerfectCRUD

extension CSDatabaseProtocol {
    public func getAll() throws -> [Entity] {
        let entities = try Self.table?.select().map { $0 }
        if let result = entities {
            return result
        }else{
            throw CSCoreDBError.entityNotFound
        }
    }
    public func get(id: Int) throws -> Entity {
        guard let entity = try Self.table?.where(\Entity.id == id).first() else {
            throw CSCoreDBError.entityNotFound
        }
        return entity
    }
}
