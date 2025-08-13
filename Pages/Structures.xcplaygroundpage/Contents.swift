struct Card {
    var content: String

    func simpleDescription() {
        print("content: \(content)")
    }
}

let card = Card(content: "abc")
card.simpleDescription()

// 结构体是值类型，赋值或传参时是值传递（复制副本）
// 注意这里必须是 var，即使是修改结构体的某个属性值，本质上也是使用新的副本替换
var card2 = card
card2.content = "123"

// 值无变化
print(card.content)
// 值有变化
print(card2.content)

struct Book {
    var title: String

    func simpleDescription() {
        print("title: \(title)")
    }

    // 可以使用方法修改属性值，但必须用 mutating 修饰
    // 本质也是使用新的副本替换
    mutating func updateTitle(title: String) {
        self.title = title
    }
}

// 这里也必须是 var
var book = Book(title: "Swift")
book.simpleDescription()

book.updateTitle(title: "Java")
book.simpleDescription()
