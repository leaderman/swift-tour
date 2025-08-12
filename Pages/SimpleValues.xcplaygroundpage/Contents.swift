// 变量
var myVariable = 42
myVariable = 50

// 常量
let myConstant = 42
// 报错
// myConstant = 50

// 定义的常量并不要求一开始就确定它的值，可以等到运行时才给它赋值。
let myConstant2: Int
myConstant2 = 31

// 整数
var intVariable: Int = 1
print(type(of: intVariable))

// 小数（32位）
var floatVariable: Float = 3.14
print(type(of: floatVariable))
// 小数（64位）
var doubleVariable: Double = 3.14
print(type(of: doubleVariable))

// 字符串
var stringVariable: String = "abc"
print(type(of: stringVariable))

// 字符
var charVariable: Character = "a"
print(type(of: charVariable))

// 布尔
var boolVariable: Bool = true
print(type(of: boolVariable))

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
// 变量
let appleSummary = "I have \(apples) apples."
// 表达式
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// 结束 """ 是基准缩进
// 每一行的缩进必须 >= 基准缩进
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """
print(quotation)

// 数组
var fruits = ["strawberries", "limes", "tangerines"]
print(fruits)

// 数组大小
print(fruits.count)

// 数组是否为空
print(fruits.isEmpty)

// 更新
fruits[1] = "grapes"
print(fruits)

// 添加
fruits.append("blueberries")
print(fruits)

// 置空
fruits = []
print(fruits)

// 空数组需要指定元素类型
let emptyArray: [String] = []
print(emptyArray)

// 字典
var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
print(occupations)

// 字典大小
print(occupations.count)

// 字典是否为空
print(occupations.isEmpty)

// 更新
occupations["Malcolm"] = ""
print(occupations)

// 添加
occupations["Jayne"] = "Public Relations"
print(occupations)

// 置空
occupations = [:]
print(occupations)

// 空字典需要指定键/值类型
let emptyDictionary: [String: Float] = [:]
print(emptyDictionary)

// 集合
var cities: Set = ["Beijing", "Tokyo", "London"]
print(cities)

// 集合大小
print(cities.count)

// 集合是否为空
print(cities.isEmpty)

// 添加
cities.insert("Wuhan")
print(cities)

// 删除
cities.remove("Wuhan")
print(cities)

// 包含
print(cities.contains("Wuhan"))

// 空集合需要指定元素类型
let emptySet: Set<String> = []
print(emptySet)
