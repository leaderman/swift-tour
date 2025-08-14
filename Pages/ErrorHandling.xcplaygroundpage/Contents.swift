// 遵循协议 Error
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
    case other(message: String)
}

// 注意 throw 和 throws 的区别
func send(job: Int, printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    } else if printerName == "other" {
        throw PrinterError.other(message: "other error")
    }

    return "Job \(job) send"
}

// 注意 do/try/catch/error 的使用
do {
    let printerResponse = try send(job: 1040, printerName: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// 处理不同类型的错误
do {
    let printerResponse = try send(job: 1440, printerName: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let PrinterError.other(message) {
    print(message)
} catch let printerError as PrinterError {
    print("Priter error: \(printerError)")
} catch {
    print(error)
}

// try? 出错时返回 nil，不会抛出错误
// printerSucess 是一个可选值
let printerSucess = try? send(job: 1884, printerName: "Mergenthaler")
print(printerSucess)

// try! 确定不会出错，直接取值；如果出错，直接崩溃
let printerFailure = try! send(job: 1885, printerName: "Never Has Toner2")
// printerFailure 不是一个可选值
print(printerFailure)

func process() {
    print("start")
    // defer 代码块会在函数中所有其他代码之后、函数返回之前执行。
    defer {
        print("before end")
    }

    print("end")
}

process()
