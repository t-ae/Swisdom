

extension VisdomClient {
    public func winExists(win: String, env: String? = nil) -> Bool? {
        let str = send(Message(win: win, env: env), endpoint: "win_exists")
        
        switch str {
        case .some("true"):
            return true
        case .some("false"):
            return false
        default:
            return .none
        }
    }
    
    public func checkConnection() -> Bool {
        return self.winExists(win: "") != nil
    }
}
