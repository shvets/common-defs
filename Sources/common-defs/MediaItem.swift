open class MediaItem: Item {
  public var imageName: String?
  public var description: String?
  public var localImage: Bool
  public var systemImage: Bool

  public init(name: String, id: String?=nil, type: String? = nil, imageName: String?=nil,
              description: String? = nil, localImage: Bool = false, systemImage: Bool = false) {
    self.imageName = imageName
    self.description = description
    self.localImage = localImage
    self.systemImage = systemImage

    super.init(name: name, id: id, type: type)
  }

  private enum CodingKeys: String, CodingKey {
    case name
    case id
    case type
    case imageName
    case description
  }

  public required convenience init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    let name = try container.decode(String.self, forKey: .name)
    let id = try container.decodeIfPresent(String.self, forKey: .id)
    let type = try container.decode(String.self, forKey: .type)
    let imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
    let description = try container.decodeIfPresent(String.self, forKey: .description)

    self.init(name: name, id: id ?? "", type: type, imageName: imageName ?? "", description: description ?? "")
  }

  public override func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)

    try container.encode(name, forKey: .name)
    try container.encode(id, forKey: .id)
    try container.encode(type, forKey: .type)
    try container.encode(imageName, forKey: .imageName)
    try container.encode(description, forKey: .description)
  }

  public override func hash(into hasher: inout Hasher) {
    hasher.combine(name)
    hasher.combine(id)
    hasher.combine(type)
    hasher.combine(imageName)
    hasher.combine(description)
  }
}

