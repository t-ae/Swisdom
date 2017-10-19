
infix operator <~

enum NullEncodableOptional<Wrapped: Encodable>: Encodable {
    case some(Wrapped)
    case none
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .none: try container.encodeNil()
        case .some(let wrapped): try container.encode(wrapped)
        }
    }
    
    init(_ optional: Wrapped?) {
        self = optional.map { .some($0) } ?? .none
    }
}
