import Cocoa

class Calculator {
    var number1: Int = 0
    var number2: Int = 0
    
    init(number1: Int, number2: Int) {
        self.number1 = number1
        self.number2 = number2
    }
    
    func summ() -> Int {
        number1 + number2
    }
    
    func difference() -> Int {
        number1 - number2
    }
    
    func multiplication() -> Int {
        number1 * number2
    }
    
    func division() -> Double {
        Double(number1) / Double(number2)
    }
}


var cal = Calculator(number1: 10, number2: 5)
print(cal.summ())
print(cal.difference())
print(cal.multiplication())
print(cal.division())


class Shape {

    var angleCount: Int = 0
    
    init(angleCount: Int) {
        self.angleCount = angleCount
    }
    
    var description: String {
        "\(type(of: self)) has \(angleCount) angles"
    }
    
    func draw() {
        print("Drawing a shape")
    }
    
}

class Rectangle: Shape {
    
    init() {
        super.init(angleCount: 4)
    }
    
    override func draw() {
        print("Drawing a rectangle")
    }
    
}

class Circle: Shape {
   
    init() {
        super.init(angleCount: 0)
    }
    
    override func draw() {
        print("drawing a circle")
    }
}

class Triangle: Shape {
    
    init() {
        super.init(angleCount: 3)
    }
    
    override func draw() {
        print("drawing a triangle")
    }
}

let shape = Shape(angleCount: 6)
let rect = Rectangle()
let tri = Triangle()
let circle = Circle()

print(shape.description)
shape.draw()

print(rect.description)
rect.draw()

print(tri.description)
tri.draw()

print(circle.description)
circle.draw()

