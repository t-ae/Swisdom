
extension VisdomClient {
    public func close(env: String? = nil) -> String? {
        let msg = Message(win: nil, env: env)
        return send(msg, endpoint: "close")
    }
    
    public func close(win: String, env: String? = nil) -> String? {
        let msg = Message(win: win, env: env)
        return send(msg, endpoint: "close")
    }
}

