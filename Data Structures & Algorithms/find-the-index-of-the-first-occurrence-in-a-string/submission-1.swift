class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var hChars = Array(haystack)
        var nChars = Array(needle)
        for i in 0...hChars.count-nChars.count {
            let curr = String(hChars[i..<(i+nChars.count)])
            if curr == needle { return i }
        }
        return -1
    }
}
