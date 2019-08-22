public struct CSCoreDB {
    public let host: String
    public let username: String
    public let password: String
    public let database: String
    public let port: Int = 3306
}

public struct CSCoreDBConfig {
    static var dbConfiguration: CSCoreDB?
}
