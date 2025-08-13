// 每一个 case 后可以有一个或多个枚举成员
// 多个 case 是为了分组
enum Direction {
    case north
    case south, east, west
}

print(Direction.north)

// 枚举可以绑定一个固定类型的原始值
// Int 是原始值类型
// Int 类型的原始值会自动从零开始递增一
enum Rank: Int {
    case one
    case two
    case three
}

let one = Rank.one
// 使用 rawValue 获取原始值
let oneRawValue = one.rawValue
print(oneRawValue)
print(Rank.two.rawValue)
print(Rank.three.rawValue)

// Int 类型的原始值显示指定从一开始递增一
enum Level: Int {
    case low = 1
    case medium
    case high
}

print(Level.low.rawValue)
print(Level.medium.rawValue)
print(Level.high.rawValue)

// Int 类型的原始值显示指定，没有显示指定的自动从上一个自增一
enum Priority: Int {
    case low = 1
    case normal
    case high = 5
    case critical
}

print(Priority.low.rawValue)
print(Priority.normal.rawValue)
print(Priority.high.rawValue)
print(Priority.critical.rawValue)

// String 类型的原始值没有显式指定时，原始值就是名称
enum Season: String {
    case spring
    case summer = "夏"
    case autumn
    case winter = "冬"
}

print(Season.spring.rawValue)
print(Season.summer.rawValue)

// 其它类型的原始值必须显式指定
enum Score: Double {
    case low = 1.0
    case medium = 2.0
}

print(Score.low.rawValue)
print(Score.medium.rawValue)

// 根据原始值创建枚举实例
// 如果原始值不存在，枚举实例为 nil
// 注意 rank 是一个可选值
var rank = Rank(rawValue: 0)
print(rank)
print(rank?.rawValue)

// 注意 rank?.rawValue 也是一个可选值，不能直接计算
print((rank?.rawValue ?? 0) + 1)

// 原始值不存在
rank = Rank(rawValue: 3)
print(rank)

// 枚举可以有方法
enum Light: String {
    case red
    case yellow
    case green

    func simpleDescription() -> String {
        // 根据当前枚举实例的值来做匹配
        switch self {
        // Light.red 的简写
        case .red:
            return "红"
        default:
            return self.rawValue
        }
    }
}

let light = Light.red
print(light.simpleDescription())

if let light = Light(rawValue: "blue") {
    // 原始值不存在，不会执行
    print(light.simpleDescription())
}

switch light {
case .red:
    print("Red")
default:
    print("Other")
}

// 枚举可以有关联值，创建枚举实例时才指定关联值
// 枚举的原始值和关联值不能同时存在
enum ServerResponse {
    case success(String)
    case failure(String)
}

// 除了知道结果是错误，还可以知道具体的错误内容
let result = ServerResponse.failure("internal error")

switch result {
// 相当于 let content = 值
case let .success(content):
    print("result: \(content)")
// 相当于 let message = 值
case let .failure(message):
    print("error: \(message)")
}
