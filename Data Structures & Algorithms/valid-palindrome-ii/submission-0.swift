class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        func isPalindrome(_ l: Int, _ r: Int,_ k: Int) -> Bool {
            var l = l
            var r = r
            while l < r {
                if chars[l] != chars[r] { 
                    guard k > 0 else { return false }
                    return isPalindrome(l, r-1, k-1) || isPalindrome(l+1, r, k-1)
                }
                l += 1
                r -= 1
            }
            return true
        }

        return isPalindrome(0, chars.count - 1, 1)
    }
}

