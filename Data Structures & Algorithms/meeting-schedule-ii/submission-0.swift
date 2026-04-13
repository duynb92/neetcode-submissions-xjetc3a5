/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        var temp = [(Int, Int)]()
        for i in intervals {
            temp.append((i.start, 1))
            temp.append((i.end, -1))
        }

        let sorted = temp.sorted { $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1) }

        var count = 0
        var maxCount = 0
        for (_, delta) in sorted {
            count += delta
            maxCount = max(maxCount, count)
        }

        return maxCount
    }
}

