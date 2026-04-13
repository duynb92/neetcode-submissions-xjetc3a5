class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        // dp[i] = min cost to reach step i
        let n = cost.count
        var dp = Array(repeating: 0, count: n + 1) // [0,0,1,2]
        dp[0] = 0
        dp[1] = 0
        for i in 2...n {
            dp[i] = min(dp[i-1] + cost[i-1], dp[i-2] + cost[i-2])
        }
        return dp[n]
    }
}
