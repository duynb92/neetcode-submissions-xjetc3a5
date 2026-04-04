class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // binary search on answer space
        // space is [1, max(piles)]
        var left = 1
        var right = piles.max()!
        var res = 0

        while left <= right {
            let mid = (left+right) / 2

            var totalTime = 0
            for p in piles {
                totalTime += Int(ceil(Double(p)/Double(mid)))
            }

            if totalTime <= h {
                res = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
}
