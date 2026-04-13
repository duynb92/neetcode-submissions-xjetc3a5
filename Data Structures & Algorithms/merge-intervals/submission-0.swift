class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 { return [] }
        if intervals.count == 1 { return intervals }

        var intervals = intervals
        let sorted = intervals.sorted { $0[0] < $1[0] } // sort by start
        var results = [sorted[0]]

        for i in 1..<sorted.count {
            let curr = sorted[i]
            let last = results.last!
            if curr[0] <= last[1] {
                results[results.count-1][1] = max(curr[1],last[1])
            } else {
                results.append(curr)
            }
        }

        return results
    }
}
