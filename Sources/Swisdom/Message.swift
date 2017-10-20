
import Foundation

protocol MessageProtocol: Encodable {
    var win: String? { get }
    var eid: String? { get set }
    
    func toJson() throws -> Data
}

extension MessageProtocol {
    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.nonConformingFloatEncodingStrategy = .throw
        return try encoder.encode(self)
    }
}

struct Message: MessageProtocol {
    var win: String?
    var eid: String?
    
    init(win: String? = nil, env: String? = nil) {
        self.win = win
        self.eid = env
    }
}
