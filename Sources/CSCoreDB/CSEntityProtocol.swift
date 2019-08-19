//
//  CSEntityProtocol.swift
//  CS-CoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import Foundation
import PerfectCRUD

protocol CSEntityProtocol: Codable, TableNameProvider {
    static var tableName: String { get }
    
    var id: Int { get set }
    
    init()
    
    func json() throws -> String
    
}

extension CSEntityProtocol {
    
    func json() throws -> String {
        let data = try JSONEncoder().encode(self)
        guard let str: String = String(data: data, encoding: .utf8) else {
            throw CSCoreDBError.jsonDataError
        }
        return str
    }
}
