//
//  CSOptianableProtocol.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 19.08.19.
//

protocol CSOptionableProtocol: CSDatabaseProtocol {
    static var optionField: KeyPath<Entity, String> { get }
}
extension CSOptionableProtocol {
    func options() -> [Int:String] {
        var res: [Int: String] = [:]
        do {
            let queryResult = try table.select().map { ($0.id, $0[keyPath: Self.optionField]) }
            for (k,v) in queryResult {
                res[k] = v
            }
        } catch {
            print(error)
        }
        return res
    }
}
