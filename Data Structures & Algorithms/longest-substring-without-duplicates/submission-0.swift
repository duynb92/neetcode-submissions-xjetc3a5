class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = Array(s)
        var result = 0
        for i in 0..<characters.count {
            var start = i
            var end = i
            var occurences: Set<Character> = Set()
            while end < characters.count && !occurences.contains(characters[end]) {
                occurences.insert(characters[end])
                result = max(result, end-start+1)
                end += 1
            }
        }
        return result
    }
}
