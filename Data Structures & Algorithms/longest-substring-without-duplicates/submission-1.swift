class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars = Array(s)
        var maxLen = 0
        var l = 0 
        var seen = Set<Character>()

        for r in 0..<chars.count {
            while seen.contains(chars[r]) {
                seen.remove(chars[l])
                l += 1
            }
            seen.insert(chars[r])
            maxLen = max(maxLen,r-l+1)
        }

        return maxLen
    }
}
