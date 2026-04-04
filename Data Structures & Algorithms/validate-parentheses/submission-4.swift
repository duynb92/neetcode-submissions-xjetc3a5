class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [String] = []
        let map: [String: String] = ["(": ")", "{": "}", "[": "]"]
        for char in s {
            if ["(","{","["].contains(String(char)) {
                stack.append(map[String(char)] ?? "")
            } else {
                if stack.isEmpty || stack.last != String(char) {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        return stack.isEmpty
    }
}
