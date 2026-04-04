class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s.lowercased())
        var l = 0
        var r = chars.count - 1
        while l < r {
            while l < r && !chars[l].isLetter && !chars[l].isNumber {
                l += 1
            }
            while l < r && !chars[r].isLetter && !chars[r].isNumber {
                r -= 1
            }
            if chars[l] != chars[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}
