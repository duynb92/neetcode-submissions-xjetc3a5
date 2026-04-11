class Solution {
    func longestPalindrome(_ s: String) -> String {
        var maxLen = 0
        var start = 0
        var chars = Array(s)

        func expand(_ l: Int, _ r: Int) {
            var l = l, r = r

            while l >= 0 , r < chars.count, chars[l] == chars[r] {
                if maxLen < r-l+1 {
                    maxLen = r-l+1
                    start = l
                }
                l -= 1
                r += 1
            }
        }

        for i in 0..<chars.count {
            expand(i, i)
            expand(i, i + 1)
        }
        return String(chars[start..<(start+maxLen)])
    }
}
