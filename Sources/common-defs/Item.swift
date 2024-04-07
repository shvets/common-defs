import Foundation

open class Item: Codable, Nameable {
  public var name: String
  public var id: String
  public var type: String?

  public init(name: String, id: String? = nil, type: String? = nil) {
    self.name = name
    self.id = id ?? name
    self.type = type
  }

  private enum CodingKeys: String, CodingKey {
    case name
    case id
    case type
  }

  public required convenience init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    let name = try container.decode(String.self, forKey: .name)
    let id = try container.decodeIfPresent(String.self, forKey: .id)
    let type = try container.decodeIfPresent(String.self, forKey: .type)

    self.init(name: name, id: id, type: type)
  }

  open func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(name, forKey: .name)
    try container.encode(id, forKey: .id)
    try container.encode(type, forKey: .type)
  }

  public static func ==(lhs: Item, rhs: Item) -> Bool {
    lhs.id == rhs.id
  }

  open func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(id)
    hasher.combine(type)
  }
}
