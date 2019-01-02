
import Foundation

struct Menu: Codable {
    let stores: [Store]
    let gifts: [Gift]
}

struct Gift: Codable {
    let name, store: String
    let points: Int
}

struct Store: Codable {
    let name, id: String
    let image, bgimage: String
    let points: Int
}
