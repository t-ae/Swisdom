
public struct Color: Encodable {
    
    public var red: UInt8
    public var green: UInt8
    public var blue: UInt8
    
    init(r: UInt8, g: UInt8, b: UInt8) {
        self.red = r
        self.green = g
        self.blue = b
    }
    
    init(intensity: UInt8) {
        self.init(r: intensity, g: intensity, b: intensity)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        let stringExpression = String(format: "#%02x%02x%02x", red, green, blue)
        
        try container.encode(stringExpression)
    }
}

extension Color {
    public static var red: Color {
        return Color(r: 255, g: 0, b: 0)
    }
    
    public static var green: Color {
        return Color(r: 0, g: 255, b: 0)
    }
    
    public static var blue: Color {
        return Color(r: 0, g: 0, b: 255)
    }
    
    public static var white: Color {
        return Color(intensity: 255)
    }
    
    public static var black: Color {
        return Color(intensity: 0)
    }
}
