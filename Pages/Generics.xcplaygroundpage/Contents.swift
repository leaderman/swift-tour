func makeArray<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []

    for _ in 0..<numberOfTimes {
        result.append(item)
    }

    return result
}

let arr = makeArray(item: "knock", numberOfTimes: 4)
print(arr)

enum OptionalValue<T, U> {
    case none
    case first(T)
    case second(U)
}

var value: OptionalValue<Int, String> = .none
print(value)

value = .first(42)
print(value)

value = .second("Hello")
print(value)

switch value {
case .none:
    print("没有值")
case .first(let num):
    print("第一个类型的值：\(num)")
case .second(let str):
    print("第二个类型的值：\(str)")
}

// 这里的 : 用于类型约束
// T: Sequence → 第一个参数 lhs 必须是 Sequence 类型（比如数组、集合等）
// U: Sequence → 第二个参数 rhs 也是 Sequence
// where T.Element: Equatable → 元素必须支持 == 比较
// T.Element == U.Element → 两个序列的元素类型必须相同
func anyCommonElements<T: Sequence, U: Sequence>(lhs: T, rhs: U) -> Bool
where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }

    return false
}

let result = anyCommonElements(lhs: [1, 2, 3], rhs: [3])
print("result: \(result)")

// 类型约束全部放到 where 中
func anyCommonElements2<T, U>(lhs: T, rhs: U) -> Bool
where T: Sequence, U: Sequence, T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }

    return false
}

let result2 = anyCommonElements2(lhs: [1, 2, 4], rhs: [3])
print("result: \(result2)")
