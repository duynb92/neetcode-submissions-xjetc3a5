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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let maxDepthLeft = maxDepth(root.left)
        let maxDepthRight = maxDepth(root.right)

        return max(maxDepthLeft, maxDepthRight) + 1
    }
}
