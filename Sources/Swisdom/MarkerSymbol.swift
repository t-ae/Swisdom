
// https://plot.ly/python/reference/

public enum MarkerSymbol: String, Encodable {
    case circle = "circle"
    case circleOpen = "circle-open"
    case circleDot = "circle-dot"
    case circleOpenDot = "circle-open-dot"
    
    case square = "square"
    case squareOpen = "square-open"
    case squareDot = "square-dot"
    case squareOpenDot = "square-open-dot"
    
    case diamond = "diamond"
    case diamondOpen = "diamond-open"
    case diamondDot = "diamond-dot"
    case diamondOpenDot = "diamond-open-dot"
    
    case closs = "closs"
    case clossOpen = "closs-open"
    case clossDot = "closs-dot"
    case clossOpenDot = "closs-open-dot"
    
    case x = "x"
    case xOpen = "x-open"
    case xDot = "x-dot"
    case xOpenDot = "x-open-dot"
    
    case triangleUp = "triangle-up"
    case triangleUpOpen = "triangle-up-open"
    case triangleUpDot = "triangle-up-dot"
    case triangleUpOpenDot = "triangle-up-open-dot"
    
    case triangleDown = "triangle-down"
    case triangleDownOpen = "triangle-down-open"
    case triangleDownDot = "triangle-down-dot"
    case triangleDownOpenDot = "triangle-down-open-dot"
    
    case triangleLeft = "triangle-left"
    case triangleLeftOpen = "triangle-left-open"
    case triangleLeftDot = "triangle-left-dot"
    case triangleLeftOpenDot = "triangle-left-open-dot"
    
    case triangleRight = "triangle-right"
    case triangleRightOpen = "triangle-right-open"
    case triangleRightDot = "triangle-right-dot"
    case triangleRightOpenDot = "triangle-right-open-dot"
    
    case triangleNE = "triangle-ne"
    case triangleNEOpen = "triangle-ne-open"
    case triangleNEDot = "triangle-ne-dot"
    case triangleNEOpenDot = "triangle-ne-open-dot"
    
    case triangleSE = "triangle-se"
    case triangleSEOpen = "triangle-se-open"
    case triangleSEDot = "triangle-se-dot"
    case triangleSEOpenDot = "triangle-se-open-dot"
    
    case triangleSW = "triangle-sw"
    case triangleSWOpen = "triangle-sw-open"
    case triangleSWDot = "triangle-sw-dot"
    case triangleSWOpenDot = "triangle-sw-open-dot"
    
    case triangleNW = "triangle-nw"
    case triangleNWOpen = "triangle-nw-open"
    case triangleNWDot = "triangle-nw-dot"
    case triangleNWOpenDot = "triangle-nw-open-dot"
    
    case pentagon = "pentagon"
    case pentagonOpen = "pentagon-open"
    case pentagonDot = "pentagon-dot"
    case pentagonOpenDot = "pentagon-open-dot"
    
    case hexagon = "hexagon"
    case hexagonOpen = "hexagon-open"
    case hexagonDot = "hexagon-dot"
    case hexagonOpenDot = "hexagon-open-dot"
    
    case octagon = "octagon"
    case octagonOpen = "octagon-open"
    case octagonDot = "octagon-dot"
    case octagonOpenDot = "octagon-open-dot"
    
    case star = "star"
    case starOpen = "star-open"
    case starDot = "star-dot"
    case starOpenDot = "star-open-dot"
    
    case hexagram = "hexagram"
    case hexagramOpen = "hexagram-open"
    case hexagramDot = "hexagram-dot"
    case hexagramOpenDot = "hexagram-open-dot"
    
    case starTriangleUp = "star-triangle-up"
    case starTriangleUpOpen = "star-triangle-up-open"
    case starTriangleUpDot = "star-triangle-up-dot"
    case starTriangleUpOpenDot = "star-triangle-up-open-dot"
    
    case starTriangleDown = "star-triangle-down"
    case starTriangleDownOpen = "star-triangle-down-open"
    case starTriangleDownDot = "star-triangle-down-dot"
    case starTriangleDownOpenDot = "star-triangle-down-open-dot"
    
    case starSquare = "star-square"
    case starSquareOpen = "star-square-open"
    case starSquareDot = "star-square-dot"
    case starSquareOpenDot = "star-square-open-dot"
    
    case starDiamond = "star-diamond"
    case starDiamondOpen = "star-diamond-open"
    case starDiamondDot = "star-diamond-dot"
    case starDiamondOpenDot = "star-diamond-open-dot"
    
    case diamondTall = "diamond-tall"
    case diamondTallOpen = "diamond-tall-open"
    case diamondTallDot = "diamond-tall-dot"
    case diamondTallOpenDot = "diamond-tall-open-dot"
    
    case diamondWide = "diamond-wide"
    case diamondWideOpen = "diamond-wide-open"
    case diamondWideDot = "diamond-wide-dot"
    case diamondWideOpenDot = "diamond-wide-open-dot"
    
    case hourglass = "hourglass"
    case hourglassOpen = "hourglass-open"
    
    case bowtie = "bowtie"
    case bowtieOpen = "bowtie-open"
    
    case circleCross = "circle-cross"
    case circleCrossOpen = "circle-cross-open"
    
    case circleX = "circle-x"
    case circleXOpen = "circle-x-open"
    
    case squareCross = "square-cross"
    case squareCrossOpen = "square-cross-open"
    
    case squareX = "square-x"
    case squareXOpen = "square-x-open"
    
    case diamondCross = "diamond-cross"
    case diamondCrossOpen = "diamond-cross-open"
    
    case diamondX = "diamond-x"
    case diamondXOpen = "diamond-x-open"
    
    case crossThin = "cross-thin"
    case clossThinOpen = "cross-thin-open"
    
    case xThin = "x-thin"
    case xThinOpen = "x-thin-open"
    
    case asterisk = "asterisk"
    case asteriskOpen = "asterisk-open"
    
    case hash = "hash"
    case hashOpen = "hash-open"
    case hashDot = "hash-dot"
    case hashOpenDot = "hash-open-dot"
    
    case yUp = "y-up"
    case yUpOpen = "y-up-open"
    
    case yDown = "y-down"
    case yDownOpen = "y-down-open"
    
    case yLeft = "y-left"
    case yLeftOpen = "y-left-open"
    
    case yRight = "y-right"
    case yRightOpen = "y-right-open"
    
    case lineEW = "line-ew"
    case lineEWOpen = "line-ew-open"
    
    case lineNS = "line-ns"
    case lineNSOpen = "line-ns-open"
    
    case lineNE = "line-ne"
    case lineNEOpen = "line-ne-open"
    
    case lineNW = "line-nw"
    case lineNWOpen = "line-nw-open"
}
