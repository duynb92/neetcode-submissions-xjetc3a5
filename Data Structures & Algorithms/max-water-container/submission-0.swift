class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var l = 0
        var r = heights.count - 1
        var res = 0
        while l < r {
            let newArea = min(heights[l], heights[r]) * (r-l)
            res = max(res, newArea)
            if heights[l] < heights[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return res
    }
}
