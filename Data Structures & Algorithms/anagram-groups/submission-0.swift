class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [[Int]: [String]] = [:]
        var output: [[String]] = []
        for str in strs {
            let count = calculateAscii(str: str)
            map[count, default: []].append(str)
        }
        for key in map.keys {
            output.append(map[key] ?? [])
        }
        return output
    }

    func calculateAscii(str: String) -> [Int] {
        var result = Array(repeating: 0, count: 26)
        for char in str {
            if let asciiValue = char.asciiValue {
                let index = Int(asciiValue) - Int(UnicodeScalar("a").value)
                result[index] += 1
            }
        }
        return result
    }
}
