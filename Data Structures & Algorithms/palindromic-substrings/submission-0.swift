class Solution {
    func countSubstrings(_ s: String) -> Int {
        var count = 0
        var chars = Array(s)

        func expand(_ l: Int, _ r: Int) {
            var l = l, r = r

            while l >= 0 , r < chars.count, chars[l] == chars[r] {
                count += 1
                l -= 1
                r += 1
            }
        }

        for i in 0..<chars.count {
            expand(i, i)
            expand(i, i + 1)
        }
        return count
    }
}
