class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        let bars = heights + [-1] // b/c height is always >= 1 - constraints
        var maxArea = Int.min

        for i in 0..<bars.count {
            while !stack.isEmpty && bars[i] < bars[stack.last!] {
                let h = bars[stack.removeLast()]
                let w = stack.isEmpty ? i : i - stack.last! - 1 
                maxArea = max(maxArea, h * w)
            }
            stack.append(i)
        }

        return maxArea
    }
}
