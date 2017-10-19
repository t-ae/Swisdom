
public class ComprehensiveOptions: Encodable {
    // MARK: Common
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
