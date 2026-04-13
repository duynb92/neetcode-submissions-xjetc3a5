class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n >= 2 else { return 1 }
        var prevOfPrev = 1
        var prev = 1
        var curr = 0
        for i in 2...n {
            curr = prev + prevOfPrev
            prevOfPrev = prev
            prev = curr
        }
        return curr
    }
}
