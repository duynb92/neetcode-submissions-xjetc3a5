class Solution {
    func reverseString(_ s: inout [Character]) {
        var start = 0
        var end = s.count - 1

        while start < end {
            let temp = s[start]
            s[start] = s[end]
            s[end] = temp
            start += 1
            end -= 1
        }
    }
}
