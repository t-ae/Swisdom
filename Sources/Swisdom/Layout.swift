struct Layout: Encodable {
    var width: Double?
    var height: Double?
    var showlegend: Bool
    var title: String?
    var xaxis: AxisFormat?
    var yaxis: AxisFormat?
    var zaxis: AxisFormat?
    var margin: Margin
    var barmode: String?
}

struct Margin: Encodable {
    var l: Double
    var r: Double
    var t: Double
    var b: Double
}

func opts2layout(opts: ComprehensiveOptions, is3d: Bool) -> Layout {
    
    let (xaxis, yaxis, zaxis) = opts2axes(opts: opts, is3d: is3d)
    
    return Layout(width: opts.width,
           height: opts.height,
           showlegend: opts.legend != nil,
           title: opts.title,
           xaxis: xaxis,
           yaxis: yaxis,
           zaxis: zaxis,
           margin: Margin(l: opts.marginleft ?? 60,
                          r: opts.marginright ?? 60,
                          t: opts.margintop ?? 60,
                          b: opts.marginbottom ?? 60),
           barmode: opts.stacked.map { $0 ? "stack" : "group" })
    
    
}

