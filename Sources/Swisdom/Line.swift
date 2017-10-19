
extension VisdomClient {
    func line(y: [Double]) {
        
        // TODO
    }
    
    func line(y: [Double], x: [Double], opts: ScatterOptions?) {
        var opts = opts ?? ScatterOptions()
        opts.markers = opts.markers ?? false
        if case .some(.lines) = opts.mode {
            opts.mode = .lines
        } else {
            opts.mode = .markersAndLines
        }
        
        // TODO
    }
}
