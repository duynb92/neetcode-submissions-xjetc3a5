class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    init() {
        stack = []
        minStack = []
    }

    func push(_ val: Int) {
        stack.append(val)
        let currentMin = minStack.isEmpty ? val : min(val, minStack.last!)
        minStack.append(currentMin)
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        if stack.isEmpty { return 0 }
        return stack.last!
    }

    func getMin() -> Int {
        if minStack.isEmpty { return 0 }
        return minStack.last!
    }
}
