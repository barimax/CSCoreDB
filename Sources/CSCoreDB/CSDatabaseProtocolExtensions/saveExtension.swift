//
//  saveExtension.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

extension CSDatabaseProtocol {
    public static func save(entity: Entity) throws -> Entity {
        var newEntity: Entity = entity
        if entity.id > 0 {
            try Self.table?.where(\Entity.id == entity.id).update(entity)
        }else{
            try Self.table?.insert(entity)
            guard let newId: Int = try Self.db?.lastInsertedId() else {
                throw CSCoreDBError.saveError(message: "No new ID.")
            }
            newEntity.id = newId
        }
        return newEntity
    }
}
