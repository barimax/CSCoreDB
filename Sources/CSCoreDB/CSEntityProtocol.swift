//
//  CSEntityProtocol.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import Foundation
import PerfectCRUD

public protocol CSEntityProtocol: Codable, TableNameProvider {
    static var tableName: String { get }
    static var singleName: String { get }
    static var pluralName: String { get }
    static func refs() -> [CSPropertyDescription<Self>]
    
    var id: Int { get set }
    
    init()
    
    func json() throws -> String
    
    
}

public extension CSEntityProtocol {
    
    func json() throws -> String {
        let data = try JSONEncoder().encode(self)
        guard let str: String = String(data: data, encoding: .utf8) else {
            throw CSCoreDBError.jsonDataError
        }
        return str
    }
}
