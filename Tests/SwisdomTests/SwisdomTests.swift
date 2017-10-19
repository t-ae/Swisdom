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
        
        var opts = ScatterOptions()
        opts.markersize = 15
        opts.markersymbol = .starOpen
        opts.colormap = .earth
        opts.markercolor = [Color.red, Color.green, Color.blue]
        
        let points = Iris.x_train.map { Point2(x: $0[0], y: $0[1]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, labels: labels, opts: opts)
        print(res)
        
        opts.markersymbol = .hexagon
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
        
        let res2 = client.line(y: [y1, y2], opts: opts)
        print(res2)
    }
    
    func testBar() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
        let y1: [Double] = [1, 2, 3, 4, 5, 6, 7]
        let y2: [Double] = [2, 3, 4, 1, 2, 3, 4]
        
        let res = client.bar(y: [y1, y2])
        print(res)
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
