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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min

        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }

            let left = max(0, dfs(node.left))
            let right = max(0, dfs(node.right))

            result = max(result, node.val + left + right)
            return node.val + max(left, right)
        }

        let _ = dfs(root)
        return result
    }
}
