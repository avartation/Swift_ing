class Vector{
    var x: Double;
    var y: Double;
    init(_ x: Double = 0, _ y: Double = 0) {
        self.x = x;
        self.y = y; 
    }
    func printVector() {
        print("Vector::  x : \(x)");
        print("          y : \(y)");
    }
}
func +(_ a: Vector, _ b: Vector) -> Vector {
    return action(a.x, a.y,
                  b.x, b.y, 
                  action: {x, y in return x + y;}
                 );
}
func -(_ a: Vector, _ b: Vector) -> Vector {
    return action(a.x, a.y,
                  b.x, b.y,
                  action: {x, y in return x - y;}
                 );
}
func *(_ v: Vector, _ c: Double) -> Vector {
    return action(v.x, c,
                  v.y, c,
                  action: {x, y in return x*y;}
                 );
}
func *(_ a: Vector, _ b: Vector) -> Double {
    let scalar = a.x * b.x + a.y * b.y;
    return scalar;
}
func action(_ ax: Double, _ ay: Double, 
            _ bx: Double, _ by: Double, 
            action: (Double, Double)->Double
           ) -> Vector {
    let x1 = action(ax, bx);
    let y1 = action(ay, by)
    var s = Vector(x1, y1);
    return s;
}

    /////*** Testing ***/////

var a = Vector(4.5, 7.2);
var b = Vector(1.1, 5.3);
print("+ operator");
var c = a + b;
c.printVector();
print("- operator");
c = a - b;
c.printVector();
print("*-scalar operator");
print(a*b);
print("* with scalar operator");
c=a*0.5;
c.printVector();
