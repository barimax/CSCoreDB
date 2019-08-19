//
//  CSPropertyDescription.swift
//  CSCoreDB
//
//  Created by Georgie Ivanov on 18.08.19.
//

import Foundation

public struct CSPropertyDescription<Entity: CSEntityProtocol>: Encodable {
    public let fieldType: FieldType,
    jsType: JSType,
    keyPath: PartialKeyPath<Entity>,
    colWidth: ColWidth,
    name: String,
    required: Bool
    
    public init(
        keyPath: PartialKeyPath<Entity>,
        fieldType: FieldType = .text,
        jsType: JSType = .string,
        colWidth: ColWidth = .normal,
        name: String = "name",
        required: Bool = true
        ){
        
        self.keyPath = keyPath
        self.fieldType = fieldType
        self.jsType = jsType
        self.colWidth = colWidth
        self.name = name
        self.required = required
        
    }
    // Codable keys
    enum CodingKeys: String, CodingKey {
        case fieldType, jsType, colWidth, name
    }
    // Encodable conformance
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(fieldType, forKey: .fieldType)
        try container.encode(jsType, forKey: .jsType)
        try container.encode(colWidth, forKey: .colWidth)
    }
}

public enum FieldType: String, Codable {
    case text,
    hidden,
    select,
    multipleSelect,
    selectedDisable,
    dateTime,
    textarea,
    textDisabled,
    dbSelect,
    dynamicFormControl,
    info,
    checkbox,
    date,
    time,
    `switch`
}

public enum ColWidth: Int, Codable {
    case small = 50
    case normal = 150
    case medium = 200
    case large = 250
    case larger = 300
    case largest = 400
    case extraLarge = 500
}

public enum JSType: String, Codable {
    case number, float, string, bool, datetime, array, object
}
