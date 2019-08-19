//
//  saveExtension.swift
//  CS-CoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import PerfectCRUD

extension CSViewProtocol {
    func save(entity: Entity) throws -> Entity {
        var newEntity: Entity = entity
        if entity.id > 0 {
            try table.where(\Entity.id == entity.id).update(entity)
        }else{
            try table.insert(entity)
            guard let newId: Int = try db.lastInsertedId() else {
                throw CSCoreDBError.saveError(message: "No new ID.")
            }
            newEntity.id = newId
        }
        return newEntity
    }
}
