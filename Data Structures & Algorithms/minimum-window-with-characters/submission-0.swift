class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sChars = Array(s)
        let tChars = Array(t)
        var need: [Character: Int] = [:]
        for t in tChars { need[t, default: 0] += 1 } // ["X": 1, "Y": 1, "Z": 1]

        var window: [Character: Int] = [:]
        var best = (len: Int.max, l: 0, r: 0)
        var l = 0
        var have = 0
        let required = need.count // 3
        for r in 0..<sChars.count {
            let c = sChars[r]
            window[c, default: 0] += 1
            if let need = need[c], window[c]! == need { have += 1 }

            while have == required {
                if r - l + 1 < best.len {
                    best = (len: r - l + 1, l: l, r: r)
                }
                let lc = sChars[l]
                window[lc]! -= 1
                if let need = need[lc], window[lc]! < need { have -= 1 }
                l += 1
            }
            
        }
        if  best.len == Int.max {
            return ""
        }
        let leftIndex = s.index(s.startIndex, offsetBy: best.l)
        let rightIndex = s.index(s.startIndex, offsetBy: best.r)
        return String(s[leftIndex...rightIndex])
    }
}
