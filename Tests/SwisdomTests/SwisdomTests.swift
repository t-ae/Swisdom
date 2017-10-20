import XCTest
import Swisdom

class SwisdomTests: XCTestCase {
    
    func testText() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
        let res = client.text("hogehoge")
        print(res)
    }
    
    func testScatter() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
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
        client.log = { print($0) }
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
        client.log = { print($0) }
        
        var opts = LineOptions { opts in
            
        }
        
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
        
        let res2 = client.line(y: [y1, y2], opts: opts)
        print(res2)
    }
    
    func testBar() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
        var opts = BarOptions()
        
        let y1: [Double] = [1, 2, 3, 4, 5, 6, 7]
        let y2: [Double] = [2, 3, 4, 1, 2, 3, 4]
        
        let res = client.bar(y: [y1, y2], opts: opts)
        print(res)
        
        opts.stacked = true
        opts.legend = ["y1", "y2"]
        let x = (0..<y1.count).map { Double($0)/10 }
        let res2 = client.bar(x:x, y: [y1, y2], opts: opts)
        print(res2)
    }
    
    func testPie() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
        let x: [Double] = [1, 2, 3, 4, 5, 1, 0, 2]
        let opts = PieOptions { opts in
            opts.title = "Pie"
            opts.legend = x.map { String($0) }
        }
        
        let res = client.pie(x: x, env: "pie", opts: opts)
        print(res)
    }
    
    func testBox() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
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
    
    func testWinExists() {
        
    }
    
    func testCheckConnection() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        let res = client.checkConnection()
        print(res)
    }
}
