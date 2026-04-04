class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        var stack: [Int] = []
        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
                let index = stack.last!
                stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }
        return result
    }
}
