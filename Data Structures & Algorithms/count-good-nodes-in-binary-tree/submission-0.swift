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
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ maxSoFar: Int) -> Int {
            guard let node else { return 0 }
            let isGood = node.val >= maxSoFar ? 1 : 0
            var newMax = max(maxSoFar, node.val)
            return isGood + dfs(node.left, newMax) + dfs(node.right, newMax)
        }

        return dfs(root, Int.min)
    }
}
