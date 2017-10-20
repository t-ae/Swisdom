

extension VisdomClient {
    func _surface(x: [[Double]],
                  type: SurfaceType,
                  win: String? = nil,
                  env: String? = nil,
                  opts: SurfaceOptions = SurfaceOptions()) -> String? {
        
        let K = x.first!.count
        precondition(!x.contains { $0.count != K })
        
        opts.xmin = opts.xmin ?? x.map { $0.min()! }.min()!
        opts.xmax = opts.xmax ?? x.map { $0.max()! }.max()!
        opts.colormap = opts.colormap ?? .viridis
        
        let is3d: Bool
        switch type {
        case .surface:
            is3d = true
        case .contour:
            is3d = false
        }
        
        let data = SurfaceData(z: x,
                               cmin: opts.xmin!,
                               cmax: opts.xmax!,
                               type: type,
                               colorscale: opts.colormap!)
        let opts = opts.toComprehensive()
        let msg = SurfaceMessage(data: [data],
                                 win: win,
                                 eid: env,
                                 layout: opts2layout(opts: opts, is3d: is3d),
                                 opts: opts)
        return send(msg)
    }
    
    public func surf(x: [[Double]],
                     win: String? = nil,
                     env: String? = nil,
                     opts: SurfaceOptions = SurfaceOptions()) -> String? {
        return _surface(x: x,
                        type: .surface,
                        win: win,
                        env: env,
                        opts: opts)
    }
}

struct SurfaceMessage: MessageProtocol {
    var data: [SurfaceData]
    var win: String?
    var eid: String?
    var layout: Layout
    var opts: ComprehensiveOptions
}

struct SurfaceData: Encodable {
    var z: [[Double]]
    var cmin: Double
    var cmax: Double
    var type: SurfaceType
    var colorscale: ColorMap
}

public class SurfaceOptions: Options {
    public var colormap: ColorMap?
    public var xmin: Double?
    public var xmax: Double?
    
    override func toComprehensive() -> ComprehensiveOptions {
        var opts = super.toComprehensive()
        opts.colormap = colormap
        opts.xmin = xmin
        opts.xmax = xmax
        
        return opts
    }
}

enum SurfaceType: String, Encodable {
    case surface = "surface"
    case contour = "contour"
}
