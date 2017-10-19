
import Foundation

extension VisdomClient {
    public func text(_ text: String, win: String? = nil, env: String? = nil) -> String? {
        let data = [
            "content": text,
            "type": "text"
        ]
        
        let message = TextMessage(data: data, win: win, env: env)
        return send(message)
    }
}

struct TextMessage: MessageProtocol {
    
    let data: [[String: String]]
    let win: String?
    var eid: String?
    let opts = ComprehensiveOptions()
    
    init(data: [String: String], win: String?, env: String?) {
        self.data = [data]
        self.win = win
        self.eid = env
    }
}
