import Foundation

extension VisdomClient {
    // MARK: 2D
    public func scatter(points: [Point2],
                        win: String? = nil,
                        env: String? = nil,
                        opts: ScatterOptions = ScatterOptions()) -> String? {
        let labels = [Int](repeating: 1, count: points.count)
        return scatter(points: points, labels: labels, win: win, env: env, opts: opts)
    }
    
    public func scatter(points: [Point2],
                        labels: [Int],
                        win: String? = nil,
                        env: String? = nil,
                        opts: ScatterOptions = ScatterOptions()) -> String? {
        precondition(points.count == labels.count)
        precondition(labels.min()! == 1)
        
        let K = labels.max()!
        
        if let legend = opts.legend {
            precondition(legend.count == K)
        }
        
        opts.colormap = opts.colormap ?? .viridis
        opts.mode = opts.mode ?? .markers
        opts.markersymbol = opts.markersymbol ?? .circle
        opts.markersize = opts.markersize ?? 10
        
        let mc = opts.markercolor
        var data: [ScatterData] = []
        for k in 1...K {
            let mask = labels.map { $0 == k }
            if mask.contains(true) {
                let points = zip(points, mask).flatMap { $0.1 ? $0.0 : nil }
                let name = opts.legend?[k-1] ?? String(k)
                let maker = MarkerData(size: opts.markersize!,
                                       symbol: opts.markersymbol!,
                                       color: mc?[k-1],
                                       line: LineData())
                data.append(ScatterData(points: points,
                                        name: name,
                                        mode: opts.mode!,
                                        marker: maker))
            }
        }
        
        let layout = opts2layout(opts: opts, is3d: false)
        
        let msg = ScatterMessage(data: data, win: win, eid: env, layout: layout, opts: opts)
        
        print(msg.data.count)
        
        return send(msg)
    }
    
    // MARK: 3D
    public func scatter(points: [Point3],
                        win: String? = nil,
                        env: String? = nil,
                        opts: ScatterOptions = ScatterOptions()) -> String? {
        let labels = [Int](repeating: 1, count: points.count)
        return scatter(points: points, labels: labels, win: win, env: env, opts: opts)
    }
    
    public func scatter(points: [Point3],
                        labels: [Int],
                        win: String? = nil,
                        env: String? = nil,
                        opts: ScatterOptions = ScatterOptions()) -> String? {
        precondition(points.count == labels.count)
        precondition(labels.min()! == 1)
        
        let K = labels.max()!
        
        if let legend = opts.legend {
            precondition(legend.count == K)
        }
        
        opts.colormap = opts.colormap ?? .viridis
        opts.mode = opts.mode ?? .markers
        opts.markersymbol = opts.markersymbol ?? .circle
        opts.markersize = opts.markersize ?? 10
        
        let mc = opts.markercolor
        var data: [ScatterData] = []
        for k in 1...K {
            let mask = labels.map { $0 == k }
            if mask.contains(true) {
                let points = zip(points, mask).flatMap { $0.1 ? $0.0 : nil }
                let name = opts.legend?[k-1] ?? String(k)
                let maker = MarkerData(size: opts.markersize!,
                                       symbol: opts.markersymbol!,
                                       color: mc?[k-1],
                                       line: LineData())
                data.append(ScatterData(points: points,
                                        name: name,
                                        mode: opts.mode!,
                                        marker: maker))
            }
        }
        
        let layout = opts2layout(opts: opts, is3d: true)
        
        let msg = ScatterMessage(data: data, win: win, eid: env, layout: layout, opts: opts)
        
        return send(msg)
    }
}

struct ScatterMessage: MessageProtocol {
    var data: [ScatterData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
    
    func toJson() throws -> Data {
        let encoder = JSONEncoder()
        encoder.nonConformingFloatEncodingStrategy = .throw
        
        _ = try encoder.encode(opts)
        
        return try encoder.encode(self)
    }
}

struct ScatterData: Encodable {
    let x: [Double]
    let y: [Double]
    let z: [Double]?
    let name: String
    let type: String
    let mode: Mode
    let marker: MarkerData
    
    init(points: [Point2], name: String, mode: Mode, marker: MarkerData) {
        self.x = points.map { $0.x }
        self.y = points.map { $0.y }
        self.z = nil
        self.name = name
        self.type = "scatter"
        self.mode = mode
        self.marker = marker
    }
    
    init(points: [Point3], name: String, mode: Mode, marker: MarkerData) {
        self.x = points.map { $0.x }
        self.y = points.map { $0.y }
        self.z = points.map { $0.z }
        self.name = name
        self.type = "scatter3d"
        self.mode = mode
        self.marker = marker
    }
}

public enum Mode: String, Encodable {
    case markers = "markers"
    case lines = "lines"
    case markersAndLines = "markers+lines"
}

struct MarkerData: Encodable {
    let size: Double
    let symbol: MarkerSymbol
    let color: Color?
    let line: LineData
}

struct LineData: Encodable {
    var color: Color = Color.black
    var width: Double = 0.5
}

public class ScatterOptions: ComprehensiveOptions {
    public override var mode: Mode? {
        get { return super.mode }
        set { super.mode = newValue }
    }
    public override var markers: Bool? {
        get { return super.markers }
        set { super.markers = newValue }
    }
    public override var colormap: ColorMap? {
        get { return super.colormap }
        set { super.colormap = newValue }
    }
    public override var markersymbol: MarkerSymbol? {
        get { return super.markersymbol }
        set { super.markersymbol = newValue }
    }
    public override var markersize: Double? {
        get { return super.markersize }
        set { super.markersize = newValue }
    }
    public override var markercolor: [Color]? {
        get { return super.markercolor }
        set { super.markercolor = newValue }
    }
    public override var legend: [String]? {
        get { return super.legend }
        set { super.legend = newValue }
    }
    
    public override init() {
        super.init()
    }
    
    // FIXME: Line plot crashes without this
    public override func encode(to encoder: Encoder) throws {
        return try super.encode(to: encoder)
    }
}
