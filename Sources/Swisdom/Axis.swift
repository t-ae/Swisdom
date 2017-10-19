public enum AxisType: String, Encodable {
    case linear = "linear"
    case log = "log"
}

struct AxisFormat: Encodable {
    var type: AxisType?
    var title: String?
    var range: [Double]?
    var tickvals: [Double]?
    var ticktext: [String]?
    var tickwidth: Double?
    var showticklabels: Bool?
}

func opts2axes(opts: ComprehensiveOptions, is3d: Bool) -> (x: AxisFormat?, y: AxisFormat?, z: AxisFormat?) {
    
    let xaxis: AxisFormat?
    if opts.xtype != nil || opts.xtick != nil || opts.xlabel != nil || opts.xtickmin != nil || opts.xtickmax != nil || opts.xtickvals != nil || opts.xticklabels != nil || opts.xtickstep != nil {
        
        let range: [Double]?
        if let min = opts.xtickmin, let max = opts.xtickmax {
            range = [min, max]
        } else {
            range = nil
        }
        
        xaxis = AxisFormat(type: opts.xtype,
                           title: opts.xlabel,
                           range: range,
                           tickvals: opts.xtickvals,
                           ticktext: opts.xticklabels,
                           tickwidth: opts.xtickstep,
                           showticklabels: opts.xtick)
    } else {
        xaxis = nil
    }
    
    let yaxis: AxisFormat?
    if opts.ytype != nil || opts.ytick != nil || opts.ylabel != nil || opts.ytickmin != nil || opts.ytickmax != nil || opts.ytickvals != nil || opts.yticklabels != nil || opts.ytickstep != nil {
        
        let range: [Double]?
        if let min = opts.ytickmin, let max = opts.ytickmax {
            range = [min, max]
        } else {
            range = nil
        }
        
        yaxis = AxisFormat(type: opts.ytype,
                           title: opts.ylabel,
                           range: range,
                           tickvals: opts.ytickvals,
                           ticktext: opts.yticklabels,
                           tickwidth: opts.ytickstep,
                           showticklabels: opts.ytick)
    } else {
        yaxis = nil
    }
    
    let zaxis: AxisFormat?
    if is3d && (opts.ztype != nil || opts.ztick != nil || opts.zlabel != nil || opts.ztickmin != nil || opts.ztickmax != nil || opts.ztickvals != nil || opts.zticklabels != nil || opts.ztickstep != nil) {
        
        let range: [Double]?
        if let min = opts.ztickmin, let max = opts.ztickmax {
            range = [min, max]
        } else {
            range = nil
        }
        
        zaxis = AxisFormat(type: opts.ztype,
                           title: opts.zlabel,
                           range: range,
                           tickvals: opts.ztickvals,
                           ticktext: opts.zticklabels,
                           tickwidth: opts.ztickstep,
                           showticklabels: opts.ztick)
    } else {
        zaxis = nil
    }
    
    
    return (xaxis, yaxis, zaxis)
}
