let individualScores = [75, 43, 103, 87, 12]

var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

// 类型必须相同
let scoreDecoration = if teamScore > 10 { "good " } else { "" }
print(scoreDecoration)

var optionalString: String?
print(optionalString == nil)

optionalString = "Hello"
print(optionalString == nil)

var optinalName: String? = "John Appleseed"
var greeting = "Hello!"

// 检查 optionalName 是否有值
// 如果有值，把值赋给一个新的常量 name，执行 if 代码块
// 如果没有值（nil），跳过 if 代码块
if let name = optinalName {
    greeting = "Hello, \(name)"
}
print(greeting)

// 常量可选时必须显式初始化
let nickname: String? = nil
let fullName = "John Appleseed"
// 可选值缺失时，使用默认值
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)

if let nickname {
    // 新的常量，作用域仅限于 if 代码块内
    print("Hey, \(nickname)")
}

let vegetable = "red pepper"

switch vegetable {
// 匹配一个值
case "celery":
    print("Add some raisins and make ants on a log.")
// 匹配多个值
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
// 匹配多个满足条件的值
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
// 默认
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0

for (name, numbers) in interestingNumbers {
    print("name: \(name), numbers: \(numbers)")

    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

var n = 2

while n < 100 {
    n *= 2
}

print(n)

var m = 2

repeat {
    m *= 2
} while m < 100

print(m)

var total = 0

// 闭开区间
for i in 1..<4 {
    print(i)
    total += i
}

print("total: \(total)")

total = 0

// 闭闭区间
for i in 1...4 {
    print(i)
    total += i
}

print("total: \(total)")
