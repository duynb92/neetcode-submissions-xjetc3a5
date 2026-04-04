class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var map: [Int: Int] = [:]
        for num in nums {
            if let _ = map[num] {
                return true
            }
            map[num, default: 0] += 1
        }
        return false
    }
}
