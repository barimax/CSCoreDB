//
//  CSCoreDBError.swift
//  CS-CoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

enum CSCoreDBError: Error {
    case connectionError
    case entityNotFound
    case jsonDataError
    case saveError(message: String)
    case registerError(message: String)
}
