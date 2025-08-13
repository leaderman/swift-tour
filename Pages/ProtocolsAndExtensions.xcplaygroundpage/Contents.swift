protocol ExampleProtocol {
    // 只读
    var simpleDescription: String { get }
    mutating func adjust()
}

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var structure = SimpleStructure()
print(structure.simpleDescription)

structure.adjust()
print(structure.simpleDescription)

protocol Describable {
    var description: String { get }
}

protocol Adjustable {
    mutating func adjust()
}

// 多个协议之间使用逗号分隔
struct MyStruct: Describable, Adjustable {
    var description: String = "Hello"

    mutating func adjust() {
        description += " (adjusted)"
    }
}

var s = MyStruct()
print(s.description)

s.adjust()
print(s.description)

struct ExampleStruct: ExampleProtocol {
    // 存储属性
    var number: Int = 10

    // 计算属性（只读）
    var simpleDescription: String {
        return "The number is \(number)"
    }

    mutating func adjust() {
        number = 20
    }

    // 计算属性（可读可写）
    var doubleValue: Int {
        get {
            return number * 2
        }
        set {
            // newValue 表示新值
            number = newValue / 2
        }
    }
}

var example = ExampleStruct()
print(example.simpleDescription)

example.adjust()
print(example.simpleDescription)

example.doubleValue = 50
print(example.number)

// extension 的作用：
// 在不修改原有类型源码的情况下，给类型添加新的功能；
// 可以用在自己写的类型上，也可以用在标准库/系统类型上。

// 给现有类型加新方法
extension String {
    func reversedString() -> String {
        return String(self.reversed())
    }
}

print("Swift".reversedString())

// 给结构体加新方法
struct Point {
    var x: Double
    var y: Double
}

extension Point {
    func distanceFromOrigin() -> Double {
        return (x * x + y * y).squareRoot()
    }
}

let p = Point(x: 3, y: 4)
print(p.distanceFromOrigin())

// 让结构体遵循协议
struct Car {
    var brand: String
}

// 这样做的好处是，类型定义部分只包含核心逻辑，不必混入所有协议实现
extension Car: Adjustable {
    mutating func adjust() {
        brand += " (adjusted)"
    }
}

var car = Car(brand: "Tesla")
print(car.brand)

car.adjust()
print(car.brand)

// 为协议写默认实现
protocol Greetable {
    func greet()
}

extension Greetable {
    func greet() {
        print("Hello!")
    }
}

struct Person: Greetable {
    // 覆盖默认实现
    func greet() {
        print("Hi!")
    }
}

let person = Person()
person.greet()
