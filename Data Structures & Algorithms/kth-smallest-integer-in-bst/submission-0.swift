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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var result = 0
        var count = 0
        
        func inorder(_ root: TreeNode?) {
            guard let root, count < k  else { return }
            inorder(root.left)
            count += 1
            if count == k { 
                result = root.val 
                return
            }
            inorder(root.right)
        }

        inorder(root)
        return result
    }
}