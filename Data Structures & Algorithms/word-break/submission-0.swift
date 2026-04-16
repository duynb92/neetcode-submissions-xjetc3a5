class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var chars = Array(s)
        let wordSet = Set(wordDict) // O(1) look up
        var dp = Array(repeating: false, count: chars.count + 1)
        dp[0] = true 
        for i in 1...chars.count {
            for j in 0..<i {
                if dp[j] && wordSet.contains(String(chars[j..<i])) {
                    dp[i] = true
                    break
                }
            }
        }

        return dp[chars.count]
    }
}

//[t,f,f,f,t,f,f,f,t,f]