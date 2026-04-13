class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted { $0[1] < $1[1] }
        var lastEnd = Int.min
        var count = 0

        for s in sorted {
            if lastEnd <= s[0] {
                lastEnd = s[1]
            } else {
                count += 1
            }
        }

        return count
    }
}
