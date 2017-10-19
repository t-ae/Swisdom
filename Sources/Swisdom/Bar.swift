
public typealias Bars = [Double]

extension VisdomClient {
    
    public func bar(y: [Bars],
                    win: String? = nil,
                    env: String? = nil,
                    opts: BarOptions = BarOptions()) -> String? {
        
        let K = y.first!.count
        
        precondition(!y.contains { $0.count != K })
        
        opts.stacked = opts.stacked ?? false
        
        let rownames: [String]
        if opts.rownames != nil {
            precondition(opts.rownames!.count == K)
            rownames = opts.rownames!
        } else {
            rownames = (1...K).map { String($0) }
        }
        if let legend = opts.legend {
            precondition(legend.count == K)
        }
        
        var data: [BarData] = []
        for k in 0..<y.count {
            data.append(BarData(y: y[k],
                                x: rownames,
                                name: opts.legend?[k]))
        }
        
        let opts = opts.toComprehensive()
        
        let msg = BarMessage(data: data,
                             win: win,
                             eid: env,
                             layout: opts2layout(opts: opts, is3d: false),
                             opts: opts)
        
        return send(msg)
    }
}

struct BarMessage: MessageProtocol {
    var data: [BarData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
}

struct BarData: Encodable {
    var y: [Double]
    var x: [String]
    var type: String = "bar"
    var name: String?
    
    init(y: [Double], x: [String], name: String?) {
        self.y = y
        self.x = x
        self.name = name
    }
}

public class BarOptions: Options {
    
    var rownames: [String]?
    var stacked: Bool?
    var legend: [String]?
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.rownames = rownames
        opts.stacked = stacked
        opts.legend = legend
        return opts
    }
}
