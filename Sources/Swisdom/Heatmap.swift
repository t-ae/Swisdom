
extension VisdomClient {
    public func heatmap(x: [[Double]],
                        win: String? = nil,
                        env: String? = nil,
                        opts: HeatmapOptions = HeatmapOptions()) -> String? {
        
        let rows = x.count
        let cols = x.first!.count
        precondition(!x.contains { $0.count != cols })
        
        opts.xmin = opts.xmin ?? x.map { $0.min()! }.min()!
        opts.xmax = opts.xmax ?? x.map { $0.max()! }.max()!
        opts.colormap = opts.colormap ?? .viridis
        
        if opts.rownames != nil {
            precondition(opts.rownames!.count == rows)
        }
        if opts.columnnames != nil {
            precondition(opts.columnnames!.count == cols)
        }
        
        let data = HeatmapData(z: x,
                               x: opts.columnnames,
                               y: opts.rownames,
                               zmin: opts.xmin!,
                               zmax: opts.xmax!,
                               colorscale: opts.colormap!)
        let opts = opts.toComprehensive()
        let msg = HeatmapMessage(data: [data],
                                 win: win,
                                 eid: env,
                                 layout: opts2layout(opts: opts, is3d: false),
                                 opts: opts)
        
        return send(msg)
    }
}

struct HeatmapMessage: MessageProtocol {
    var data: [HeatmapData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
}

struct HeatmapData: Encodable {
    var z: [[Double]]
    var x: [String]?
    var y: [String]?
    var zmin: Double
    var zmax: Double
    var type = "heatmap"
    var colorscale: ColorMap
    
    init(z: [[Double]], x: [String]?, y: [String]?, zmin: Double, zmax: Double, colorscale: ColorMap) {
        self.z = z
        self.x = x
        self.y = y
        self.zmin = zmin
        self.zmax = zmax
        self.colorscale = colorscale
    }
}

public class HeatmapOptions: Options {
    public var colormap: ColorMap?
    public var xmin: Double?
    public var xmax: Double?
    public var columnnames: [String]?
    public var rownames: [String]?
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.colormap = colormap
        opts.xmin = xmin
        opts.xmax = xmax
        opts.columnnames = columnnames
        opts.rownames = rownames
        return opts
    }
}
