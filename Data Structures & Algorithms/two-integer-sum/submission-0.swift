class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            if let firstIndex = map[num] {
                return [firstIndex, index]
            }
            map[target-num] = index
        }
        return []
    }
}
