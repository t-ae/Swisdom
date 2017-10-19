
struct ComprehensiveOptions: Encodable {
    // MARK: Common
    var title: String?
    var width: Double?
    var height: Double?
    var showlegends: Bool?
    
    var xtype: AxisType?
    var xlabel: String?
    var xtick: Bool?
    var xtickmin: Double?
    var xtickmax: Double?
    var xtickvals: [Double]?
    var xticklabels: [String]?
    var xtickstep: Double?
    
    var ytype: AxisType?
    var ylabel: String?
    var ytick: Bool?
    var ytickmin: Double?
    var ytickmax: Double?
    var ytickvals: [Double]?
    var yticklabels: [String]?
    var ytickstep: Double?
    
    var ztype: AxisType?
    var zlabel: String?
    var ztick: Bool?
    var ztickmin: Double?
    var ztickmax: Double?
    var ztickvals: [Double]?
    var zticklabels: [String]?
    var ztickstep: Double?
    
    var marginleft: Double?
    var marginright: Double?
    var margintop: Double?
    var marginbottom: Double?
    
    // MARK: Scatter specific
    var mode: Mode?
    var markers: Bool?
    var colormap: ColorMap?
    var markersymbol: MarkerSymbol?
    var markersize: Double?
    var markercolor: [Color]?
    var legend: [String]?
    
    // MARK: Line specific
    var fillarea: Bool?
    
    // MARK: Heatmap specific
    var columnnames: [String]?
    var rownames: [String]?
    
    // MARK: Histogram specific
    var numbins: Int?
    
    // MARK: Surf, Contour specific
    var xmin: Double?
    var xmax: Double?
    
    // MARK: Quiver specific
    var normalize: Double?
    var arrowheads: Bool?
    
    // MARK: Mesh specific
    var color: Color?
    var opacity: Double? {
        willSet {
            guard let newValue = newValue else {
                return
            }
            precondition(0 <= newValue && newValue <= 1)
        }
    }
    
    init() {}
}

public class Options {
    public var title: String?
    public var width: Double?
    public var height: Double?
    public var showlegends: Bool?
    
    public var xtype: AxisType?
    public var xlabel: String?
    public var xtick: Bool?
    public var xtickmin: Double?
    public var xtickmax: Double?
    public var xtickvals: [Double]?
    public var xticklabels: [String]?
    public var xtickstep: Double?
    
    public var ytype: AxisType?
    public var ylabel: String?
    public var ytick: Bool?
    public var ytickmin: Double?
    public var ytickmax: Double?
    public var ytickvals: [Double]?
    public var yticklabels: [String]?
    public var ytickstep: Double?
    
    public var ztype: AxisType?
    public var zlabel: String?
    public var ztick: Bool?
    public var ztickmin: Double?
    public var ztickmax: Double?
    public var ztickvals: [Double]?
    public var zticklabels: [String]?
    public var ztickstep: Double?
    
    public var marginleft: Double?
    public var marginright: Double?
    public var margintop: Double?
    public var marginbottom: Double?
    
    init() {}
    
    func toComprehensive() -> ComprehensiveOptions {
        var opts = ComprehensiveOptions()
        
        opts.title = title
        opts.width = width
        opts.height = height
        opts.showlegends = showlegends
        
        opts.xtype = xtype
        opts.xlabel = xlabel
        opts.xtick = xtick
        opts.xtickmin = xtickmin
        opts.xtickmax = xtickmax
        opts.xtickvals = xtickvals
        opts.xticklabels = xticklabels
        opts.xtickstep = xtickstep
        
        opts.ytype = ytype
        opts.ylabel = ylabel
        opts.ytick = ytick
        opts.ytickmin = ytickmin
        opts.ytickmax = ytickmax
        opts.ytickvals = ytickvals
        opts.yticklabels = yticklabels
        opts.ytickstep = ytickstep
        
        opts.ztype = ztype
        opts.zlabel = zlabel
        opts.ztick = ztick
        opts.ztickmin = ztickmin
        opts.ztickmax = ztickmax
        opts.ztickvals = ztickvals
        opts.zticklabels = zticklabels
        opts.ztickstep = ztickstep
        
        opts.marginleft = marginleft
        opts.marginright = marginright
        opts.margintop = margintop
        opts.marginbottom = marginbottom
        
        return opts
    }
}
