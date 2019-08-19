//
//  getExtension.swift
//  CS-CoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//
import PerfectCRUD

extension CSViewProtocol {
    func getAll() throws -> [Entity] {
        return try table.select().map { $0 }
    }
    func get(id: Int) throws -> Entity {
        guard let entity = try table.where(\Entity.id == id).first() else {
            throw CSCoreDBError.entityNotFound
        }
        return entity
    }
}
