func fetchUserID(server: String) async -> Int {
    if server == "primary" {
        return 97
    }

    return 501
}

func fetchUsername(server: String) async -> String {
    let userID = await fetchUserID(server: server)
    if userID == 501 {
        return "John Appleseed"
    }

    return "Guest"
}

func connectUser(server: String) async {
    async let userID = fetchUserID(server: server)
    async let username = fetchUsername(server: server)

    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

// 使用 Task 从同步代码中调用异步函数，而无需等待它们返回。
Task {
    await connectUser(server: "primary")
}

func getUser(server: String) async -> (Int, String) {
    async let userID = fetchUserID(server: server)
    async let username = fetchUsername(server: server)

    return await (userID, username)
}

Task {
    let (userID, username) = await getUser(server: "primary")

    print(userID)
    print(username)
}

Task {
    let servers = ["primary", "secondary", "development"]
    let tasks = servers.map { server in
        Task { await fetchUserID(server: server) }
    }

    var results: [Int] = []

    for task in tasks {
        let value = await task.value
        results.append(value)
    }

    print(results)
}
