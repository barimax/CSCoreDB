//
//  Register.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import Foundation

public class Register {
    var registerStore: [String: Any] = [:]
    private var locked: Bool = false
    var viewRegister: [String: Any] = [:]
    
    public init() {}
    
    public init(registerStore: [String: Any]) {
        self.registerStore = registerStore
        self.locked = true
    }
    
    public func add<T: CSEntityProtocol>(entityType: T.Type, forKey: String) throws {
        if registerStore[forKey] == nil && !locked {
            registerStore[forKey] = entityType
            viewRegister[forKey] = try CSView<T>()
        }else{
            throw CSCoreDBError.registerError(message: "Type for this key already exists.")
        }
    }
    public func getView<T: CSEntityProtocol>(forKey: String) throws -> CSView<T> {
        guard let view = viewRegister[forKey], let result = view as? CSView<T> else {
            throw CSCoreDBError.registerError(message: "No type found for this key.")
        }
        return result
    }
    public func get<T: CSEntityProtocol>(forKey: String) throws -> T.Type {
        guard let type = registerStore[forKey], let result = type as? T.Type else {
            throw CSCoreDBError.registerError(message: "No type found for this key.")
        }
        return result
    }
    public func getAll<T: CSEntityProtocol>() -> [T.Type] {
        var result: [T.Type] = []
        for (_, value) in self.registerStore {
            if let r: T.Type = value as? T.Type {
                result.append(r)
            }
        }
        return result
    }
    public func resolve<T: CSEntityProtocol>(forKey: String) throws -> T {
        let result: T.Type = try self.get(forKey: forKey)
        return result.init()
    }
    public func resoveAll<T:CSEntityProtocol>() -> [T] {
        var result: [T] = []
        for t: T.Type in self.getAll() {
            result.append(t.init())
        }
        return result
    }

    private func type<T: CSEntityProtocol>(t: Any) throws -> T.Type {
        guard let result = t.self as? T.Type else {
            throw CSCoreDBError.registerError(message: "Error")
        }
        return result
    }
    func lock() {
        self.locked = true
    }
}
