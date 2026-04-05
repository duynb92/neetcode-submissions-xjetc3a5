/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        // (min,max) range
        isValid(root, min: Int.min, max: Int.max)
    }

    func isValid(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node else { return true }
        if node.val <= min || node.val >= max { return false }
        return isValid(node.left, min: min, max: node.val) && isValid(node.right, min: node.val, max: max)
    }
}
