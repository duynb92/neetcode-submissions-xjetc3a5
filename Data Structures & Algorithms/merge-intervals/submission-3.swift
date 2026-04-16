class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var sorted = intervals.sorted(by: { $0[0] < $1[0] }) // O(n log n)
        var result = [sorted[0]]
        
        for i in 1..<sorted.count {
            let interval = sorted[i] // current interval
            var last = result[result.count - 1]
            if interval[0] <= last[1] {
                // extend last merge
                result[result.count-1][0] = min(last[0], interval[0])
                result[result.count-1][1] = max(last[1], interval[1])
            } else {
                result.append(interval)
            }
        }

        return result
    }
}

[[0,2],[1,4],[3,5]]
