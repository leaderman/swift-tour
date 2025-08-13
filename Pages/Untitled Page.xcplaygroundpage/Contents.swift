protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

struct SimpleStructure: ExampleProtocol {
    var simple: String
    var simpleDescription: String { simple }

    mutating func adjust() { simple += " (adjusted)" }
}

let a = SimpleStructure(simple: "abc")

// 旧写法（兼容旧 Swift）
let pOld: ExampleProtocol = a
print(pOld.simpleDescription)

// 新写法（Swift 5.6+）
let pNew: any ExampleProtocol = a
print(pNew.simpleDescription)

// 调用 mutating 需要 var
var pVar: any ExampleProtocol = SimpleStructure(simple: "xyz")
pVar.adjust()
print(pVar.simpleDescription)
