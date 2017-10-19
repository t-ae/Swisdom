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
        opts.markersymbol = .diamond
        opts.colormap = .earth
        opts.markercolor = [Color.red, Color.green, Color.blue]
        
        let points = Iris.x_train.map { Point2(x: $0[0], y: $0[1]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, label: labels, opts: opts)
        print(res)
    }
    
    func testScatter3D() {
        let client = try! VisdomClient()
        client.log = { print($0) }
        
        var opts = ScatterOptions()
        opts.markersize = 2
        opts.markersymbol = .circle
        opts.colormap = .earth
        opts.markercolor = [Color.red, Color.green, Color.blue]
        
        let points = Iris.x_train.map { Point3(x: $0[0], y: $0[1], z: $0[2]) }
        let labels = Iris.y_train.map { $0 + 1 }
        
        let res = client.scatter(points: points, label: labels, opts: opts)
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
