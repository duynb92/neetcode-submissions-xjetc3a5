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
    func isBalanced(_ root: TreeNode?) -> Bool {
        checkHeight(root) != -1
    }

    func checkHeight(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let leftHeight = checkHeight(root.left)
        if leftHeight == -1 { return -1 }

        let rightHeight = checkHeight(root.right)
        if rightHeight == -1 { return -1 }

        if abs(leftHeight-rightHeight) > 1 { return -1 }

        return max(leftHeight, rightHeight) + 1
    }
}
