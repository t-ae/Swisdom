import XCTest
import Swisdom

#if !SWIFT_PACKAGE
class SwisdomTests: XCTestCase {
    
    func testText() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        let res = client.text("hogehoge")
        print(res)
    }
    
    func testScatter() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        var opts = ScatterOptions { opts in
            opts.markersize = 15
            opts.markersymbol = .starOpen
            opts.colormap = .earth
            opts.markercolor = [Color.red, Color.green, Color.blue]
        }
        
        let points = Iris.x_train.map { Point2(x: $0[0], y: $0[1]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, labels: labels, opts: opts)
        print(res)
        
        opts.markersymbol = .hexagon
        opts.xtick = false
        opts.ytickstep = 1
        opts.legend = ["Iris1", "Iris2", "Iris3"]
        let res2 = client.scatter(points: points, labels: labels, opts: opts)
        print(res2)
    }
    
    func testScatter3D() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        var opts = ScatterOptions { opts in
            opts.markersize = 2
            opts.markersymbol = .diamond
            opts.colormap = .earth
            opts.markercolor = [Color.red, Color.green, Color.blue]
        }
        
        let points = Iris.x_train.map { Point3(x: $0[0], y: $0[1], z: $0[2]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, labels: labels, opts: opts)
        print(res)
    }
    
    func testLine() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        var opts = LineOptions()
        
        let y1 = (0..<100).map { x -> Double in
            let x = Double(x) / 100
            return 3*x*x*x - 2*x*x - x + 2
        }
        let y2 = (0..<100).map { x -> Double in
            let x = Double(x) / 100
            return -3*x*x*x + 4*x*x - x
        }
        
        let res = client.line(y: [y1, y2], opts: opts)
        print(res)
        
        opts.fillarea = true
        opts.markers = true
        opts.ytickvals = [1, 2, 3, 4]
        opts.yticklabels = ["1!", "2!", "3!", "4!"]
        let res2 = client.line(y: [y1, y2], opts: opts)
        print(res2)
    }
    
    func testBar() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        var opts = BarOptions()
        
        let y1: [Double] = [1, 2, 3, 4, 5, 6, 7]
        let y2: [Double] = [2, 3, 4, 1, 2, 3, 4]
        
        let res = client.bar(y: [y1, y2], opts: opts)
        print(res)
        
        opts.stacked = true
        opts.legend = ["y1", "y2"]
        opts.rownames = (1...7).map { "\($0)!" }
        let x = (0..<y1.count).map { "\(Double($0)/10)!" }
        let res2 = client.bar(x:x, y: [y1, y2], opts: opts)
        print(res2)
    }
    
    func testPie() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        let x: [Double] = [1, 2, 3, 4, 5, 1, 0, 2]
        let opts = PieOptions()
        
        let res = client.pie(x: x, env: "pie", opts: opts)
        print(res)
        
        opts.title = "Pie"
        opts.legend = (1...8).map { "category\($0)" }
        opts.width = 1000
        opts.height = 500
        opts.marginbottom = 100
        opts.marginright = 400
        let res2 = client.pie(x: x, env: "pie", opts: opts)
        print(res2)
    }
    
    func testBox() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        do {
            let boxes: [[Double]] = [
                [0, 1, 2, 3, 4, 5],
                [1, 1, 1, 2, 3, 4],
                [3, 3, 2, 2, 4, 4],
                [1, 2, 2, 3, 3, 3, 3, 3, 3, 3 ,3, 4, 4, 5]
            ]
            
            let opts = BoxOptions { opts in
                
            }
            
            let res = client.boxplot(boxes: boxes, opts: opts)
            print(res)
        }
        do {
            let iris0 = zip(Iris.x_train, Iris.y_train).flatMap { $0.1 == 0 ? $0.0 : nil }
            let iris1 = zip(Iris.x_train, Iris.y_train).flatMap { $0.1 == 1 ? $0.0 : nil }
            let iris2 = zip(Iris.x_train, Iris.y_train).flatMap { $0.1 == 2 ? $0.0 : nil }
            
            let boxes = [
                iris0.map { $0[0] },
                iris1.map { $0[0] },
                iris2.map { $0[0] }
            ]
            
            let opts = BoxOptions { opts in
                opts.legend = [
                    "Iris0", "Iris1", "Iris2"
                ]
            }
            
            let res = client.boxplot(boxes: boxes, opts: opts)
            print(res)
        }
    }
    
    func testSurface() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        let x: [[Double]] = [
            [0, 0, 0, 3, 1, 0],
            [0, 1, 6, 8, 2, 0],
            [0, 2, 9, 9, 5, 3],
            [1, 3, 7, 8, 4, 2],
            [0, 2, 5, 4, 3, 0],
            [0, 0, 2, 1, 1, 0]
        ]
        
        var opts = SurfaceOptions()
        
        let res = client.surf(x: x, opts: opts)
        print(res)
        
        opts.colormap = .blues
        opts.xmin = 2
        opts.xmax = 5
        let res2 = client.surf(x: x, opts: opts)
        print(res2)
    }
    
    func testContour() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        let x: [[Double]] = [
            [0, 0, 0, 3, 1, 0],
            [0, 1, 6, 8, 2, 0],
            [0, 2, 9, 9, 5, 3],
            [1, 3, 7, 8, 4, 2],
            [0, 2, 5, 4, 3, 0],
            [0, 0, 2, 1, 1, 0]
        ]
        
        var opts = SurfaceOptions()
        
        let res = client.contour(x: x, opts: opts)
        print(res)
        
        opts.colormap = .earth
        opts.xmin = 2
        opts.xmax = 5
        opts.xlabel = "x dayo"
        opts.ylabel = "y dayo"
        let res2 = client.contour(x: x, opts: opts)
        print(res2)
    }
    
    func testHeatmap() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        let x: [[Double]] = [
            [0, 0, 0, 3, 1, 0],
            [0, 1, 6, 8, 2, 0],
            [0, 2, 9, 9, 5, 3],
            [1, 3, 7, 8, 4, 2],
            [0, 2, 5, 4, 3, 0],
            [0, 0, 2, 1, 1, 0]
        ]
        
        var opts = HeatmapOptions()
        
        let res = client.heatmap(x: x, opts: opts)
        print(res)
        
        opts.colormap = .greens
        opts.xmin = 2
        opts.xmax = 5
        opts.rownames = (1...6).map { "row\($0)!" }
        opts.columnnames = (1...6).map { "col\($0)!" }
        let res2 = client.heatmap(x: x, opts: opts)
        print(res2)
    }
    
    func testWinExists() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        let res = client.winExists(win: "")
        print(res)
    }
    
    func testCheckConnection() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        let res = client.checkConnection()
        print(res)
    }
    
    func testChangeWin() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        var opts = ScatterOptions { opts in
            opts.markersize = 15
            opts.markersymbol = .starOpen
            opts.colormap = .earth
            opts.markercolor = [Color.red, Color.green, Color.blue]
        }
        
        let points = Iris.x_train.map { Point2(x: $0[0], y: $0[1]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, labels: labels, opts: opts)
        print(res)
        
        sleep(3)
        
        let res2 = client.text("hogehoge", win: res)
        print(res2)
    }
    
    func testClose() {
        let client = try! VisdomClient()
        client.logger = { print($0) }
        
        var opts = ScatterOptions { opts in
            opts.markersize = 15
            opts.markersymbol = .starOpen
            opts.colormap = .earth
            opts.markercolor = [Color.red, Color.green, Color.blue]
        }
        
        let points = Iris.x_train.map { Point2(x: $0[0], y: $0[1]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, labels: labels, opts: opts)
        print(res)
        
        sleep(3)
        
        let res2 = client.close(win: res!)
        print(res2)
    }
}
#endif
