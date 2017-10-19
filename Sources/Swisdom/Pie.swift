
extension VisdomClient {
    public func pie(x: [Double],
                    win: String? = nil,
                    env: String? = nil,
                    opts: PieOptions = PieOptions()) -> String? {
        
        precondition(!x.contains { $0 < 0 })
        
        if opts.legend != nil {
            precondition(opts.legend!.count == x.count)
        }
        
        let data = PieData(values: x,
                           labels: opts.legend)
        
        let opts = opts.toComprehensive()
        let msg = PieMessage(data: [data],
                             win: win,
                             eid: env,
                             layout: opts2layout(opts: opts, is3d: false),
                             opts: opts)
        return send(msg)
    }
}

struct PieMessage: MessageProtocol {
    var data: [PieData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
}

struct PieData: Encodable {
    var values: [Double]
    var labels: [String]?
    var type = "pie"
    
    init(values: [Double], labels: [String]?) {
        self.values = values
        self.labels = labels
    }
}

public class PieOptions: Options {
    public var legend: [String]?
    
    public required init() {
        super.init()
    }
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.legend = legend
        return opts
    }
}
