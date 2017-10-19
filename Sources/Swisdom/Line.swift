
public typealias Line = [Double]

extension VisdomClient {
    public func line(y: [Line],
                     win: String? = nil,
                     env: String? = nil,
                     opts: LineOptions = LineOptions()) -> String? {
        
        let x = linspace(start: 0, end: 1, count: y.first!.count)
        
        return line(x: x, y: y, win: win, env: env, opts: opts)
    }
    
    public func line(x: [Double],
                     y: [Line],
                     win: String? = nil,
                     env: String? = nil,
                     opts: LineOptions = LineOptions()) -> String? {
        
        precondition(!y.contains { $0.count != x.count }, "All lines must have same length as x.")
        
        opts.markers = opts.markers ?? false
        opts.fillarea = opts.fillarea ?? false
        opts.mode = opts.markers! ? .markersAndLines : .lines
        
        var points: [Point2] = []
        for line in y {
            for (x, y) in zip(x, line){
                points.append(Point2(x: x, y: y))
            }
        }
        
        let labels: [Int]?
        if y.count == 1 {
            labels = nil
        } else {
            let numLabels = y.count
            labels = (1...numLabels).flatMap { [Int](repeating: $0, count: x.count) }
        }
        
        if let labels = labels {
            return scatter(points: points, labels: labels, win: win, env: env, opts: opts)
        } else {
            return scatter(points: points, win: win, env: env, opts: opts)
        }
    }
}

public class LineOptions: ScatterOptions {
    public var fillarea: Bool?
    
    public override init() {
        super.init()
    }
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.fillarea = fillarea
        return opts
    }
}
