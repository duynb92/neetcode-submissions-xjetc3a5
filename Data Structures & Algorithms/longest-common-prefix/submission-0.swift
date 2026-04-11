class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // assuming the first element is the longest prefix
        // drop last until found the common prefix

        var prefix = strs[0]
        for str in strs.dropFirst() {
            while !str.hasPrefix(prefix) {
                prefix = String(prefix.dropLast())
                if prefix.isEmpty { return "" }
            }
        }
        return prefix
    }
}
