public struct CSCoreDB {
    let host: String
    let username: String
    let password: String
    let database: String
    let port: Int = 3306
}

public struct CSCoreDBConfig {
    static var dbConfiguration: CSCoreDB?
}
