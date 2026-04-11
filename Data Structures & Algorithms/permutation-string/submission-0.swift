class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        var need: [Character: Int] = [:]
        var window: [Character: Int] = [:]

        for c in chars1 { need[c, default: 0] += 1 } // [a:1,b:1,c:1]

        for i in 0..<chars2.count {
            let c = chars2[i] 
            window[c, default: 0] += 1 // [l:1,e:1,c:1,a:1]
            if i >= chars1.count { 
                let out = chars2[i-chars1.count]
                window[out]! -= 1
                if window[out] == 0 { window.removeValue(forKey: out) } // [e:1,c:1,a:1]
            }

            if window == need { return true }
        }

        return false
    }
}
