// 没有返回值时，不需要使用 -> Void
func sayHello() {
    print("Hello, Swift!")
}

sayHello()

func greet(persion: String, day: String) -> String {
    return "Hello \(persion), today is \(day)."
}

// 参数需要按顺序传递
print(greet(persion: "Bob", day: "Tuesday"))

// 基本元组
let person = ("Alice", 25)
// 元组元素通过下标访问
print(person.0)
print(person.1)

// 命名元组
let person2 = (name: "Alice", age: 25)
// 元组元素通过名称访问
print(person2.name)
print(person2.age)

// 元素解构
let (name, age) = ("Bob", 30)
print(name)
print(age)

// 元组作为函数返回值
// name 和 age 不是函数内的局部变量，仅作为返回值元组的元素标签
func getUser() -> (name: String, age: Int) {
    return ("Charlie", 28)
}

let user = getUser()
print(user.name)
print(user.age)

// 嵌套元组
let student = (id: 101, info: (name: "David", score: 95))
print(student.id)
print(student.info.name)
print(student.info.score)

// 仅使用 var 声明创建的元组支持修改元组的元组值
// 无论使用 let 或 var 声明创建的元组，元组的结构（个数和类型）都不能改变
var persion3 = (name: "Alice", age: 25)
persion3.name = "Bob"
persion3.age = 26

// 嵌套函数
func returnFifteen() -> Int {
    var y = 10

    func add() {
        y += 5
    }
    add()

    return y
}

print(returnFifteen())

// 函数作为返回值
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }

    // 返回函数，不是调用函数
    return addOne
}

// 不能 makeIncrementer(1)
var increment = makeIncrementer()
print(increment(1))

// 注意 () -> Void
func makePing() -> (() -> Void) {
    func ping() {
        print("ping")
    }

    return ping
}

var doPing = makePing()
doPing()

// 函数作为参数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }

    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

// 闭包（无参数和返回值）
let sayHi = { print("Hi") }
sayHi()

// 闭包（有参数和返回值），注意 in
let greet = { (name: String) -> String in
    return "Hello, \(name)"
}
print(greet("Swift"))

numbers = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(numbers)

// 省略参数类型和返回值类型，如果是多个参数，使用逗号分隔
numbers = numbers.map({ number in
    return 3 * number
})
print(numbers)

// 单选代码时可以省略 return
numbers = numbers.map({ number in 3 * number })
print(numbers)

// 闭包是函数的最后一个参数时，可以省略()
numbers = numbers.map { number in 3 * number }
print(numbers)

// 使用数字代替参数名
numbers = numbers.map { 3 * $0 }
print(numbers)

numbers = numbers.sorted { $0 < $1 }
print(numbers)
