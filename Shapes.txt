struct Point {
    let x: Double
    let y: Double
    init(_ _x: Double,_ _y: Double) {
        x = _x
        y = _y
    }
}

func dist(_ a: Point,_ b: Point) -> Double {
    return sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y))
}

class Shape {
    func area() -> Double {
        return 0.0
    }
}

class Triangle: Shape {
    let a: Point
    let b: Point
    let c: Point
    lazy var _area = calculateArea()
    
    init?(_ points: [Point]) {
        if points.count != 3 {
            return nil
        }
        a = points[0]
        b = points[1]
        c = points[2]
    }
    
    func calculateArea() -> Double {
        let ab = dist(a, b)
        let bc = dist(b, c)
        let ac = dist(a, c)
        let p = (ab + bc + ac) / 2
        return sqrt(p*(p - ab)*(p - bc)*(p - ac))
    }
    
    override func area() -> Double {
        return _area
    }
}

class Square: Shape {
    let a: Point
    let b: Point
    let c: Point
    let d: Point
    let side: Double
    lazy var _area = calculateArea()
    
    init?(_ points: [Point]) {
        if points.count != 4 {
            return nil
        }
        if (dist(points[0], points[1]) != dist(points[1], points[2]) 
            || dist(points[0], points[2]) != dist(points[1], points[3])) {
            return nil
        }
        a = points[0]
        b = points[1]
        c = points[2]
        d = points[3]
        side = dist(points[0], points[1])
    }
    
    func calculateArea() -> Double {
        return side * side
    }
    
    override func area() -> Double {
        return _area
    }
}

class Circle: Shape {
    let center: Point
    let radius: Double
    lazy var _area = calculateArea()
    
    init(_ o: Point,_ r: Double) {
        center = o
        radius = r
    }
    
    func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
    
    override func area() -> Double {
        return _area
    }
}

let trianglePoints = [Point(-1, 0), Point(0, 1), Point(1, 0)]
let squarePoints = [Point(-1, -1), Point(-1, 1), Point(1, 1), Point(1, -1)]
let center = Point(0, 0)
let radius = 1.0

let shapes: [Shape?] = [Triangle(trianglePoints), Square(squarePoints), Circle(center, radius)]

for shape in shapes {
    guard let shape = shape else { continue }
    print(shape.area())
}


