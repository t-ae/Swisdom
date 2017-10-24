
import Foundation

public class VisdomClient {
    
    let url: URL
    let env: String
    
    public var logger: ((String)->Void)? = nil
    
    public init(url: URL, env: String = "main") {
        self.url = url
        self.env = env
    }
    
    public convenience init(server: String = "http://localhost", port: Int = 8097, env: String = "main") throws {
        
        let urlPort = "\(server):\(port)"
        
        guard let url = URL(string: urlPort) else {
            throw SwisdomError.failedToParseURL
        }
        self.init(url: url, env: env)
    }
    
    func send(_ message: MessageProtocol, endpoint: String = "events") -> String? {
        var message = message
        if message.eid == nil {
            message.eid = self.env
        }
        
        let url = self.url.appendingPathComponent(endpoint)
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        let json = try! message.toJson()
        req.httpBody = json
        
        logger?("Request: \(url)")
        if let messageString = String(data: json, encoding: .utf8) {
            logger?("Message: \(messageString)")
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        var ret: String? = nil
        URLSession.shared.dataTask(with: req) { [weak self] data, response, error in
            defer { semaphore.signal() }
            
            if let response = response {
                self?.logger?("Response: \(response)")
            }
            ret = data.flatMap { String(data: $0, encoding: .utf8) }
        }.resume()
        
        semaphore.wait()
        return ret
    }
}
public enum SwisdomError: Error {
    case failedToParseURL
}
