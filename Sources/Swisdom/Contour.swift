
extension VisdomClient {
    public func contour(x: [[Double]],
                        win: String? = nil,
                        env: String? = nil,
                        opts: SurfaceOptions = SurfaceOptions()) -> String? {
        return _surface(x: x,
                        type: .contour,
                        win: win,
                        env: env,
                        opts: opts)
    }
}
