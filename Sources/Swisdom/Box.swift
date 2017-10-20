
public typealias Box = [Double]

extension VisdomClient {
    
    public func boxplot(boxes: [Box],
                        win: String? = nil,
                        env: String? = nil,
                        opts: BoxOptions = BoxOptions()) -> String? {
        
        if opts.legend != nil {
            precondition(opts.legend!.count == boxes.count)
        }
        
        var data: [BoxData] = []
        for k in 0..<boxes.count {
            let name = opts.legend?[k] ?? "column \(k)"
            data.append(BoxData(y: boxes[k],
                                name: name))
        }
        
        let opts = opts.toComprehensive()
        let msg = BoxMessage(data: data,
                             win: win,
                             eid: env,
                             layout: opts2layout(opts: opts, is3d: false),
                             opts: opts)
        
        return send(msg)
    }
}

struct BoxMessage: MessageProtocol {
    var data: [BoxData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
}

struct BoxData: Encodable {
    
    var y: [Double]
    var name: String
    var type = "box"
    
    init(y: [Double], name: String) {
        self.y = y
        self.name = name
    }
}

public class BoxOptions: Options {
    public var legend: [String]?
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.legend = legend
        return opts
    }
}
