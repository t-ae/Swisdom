

func linspace(start: Double, end: Double, count: Int) -> [Double] {
    let distance = (end - start)
    
    return (0..<count).map { start + Double($0)*distance/Double(count-1) }
}
