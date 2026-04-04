class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var map: [Character: Int] = [:]
        for char in s {
            map[char, default: 0] += 1
        }
        for char in t {
            if var count = map[char] {
                count -= 1
                map[char] = count
            }
        }
        for key in map.keys {
            if map[key] != 0 {
                return false
            }
        }
        return true
    }
}
