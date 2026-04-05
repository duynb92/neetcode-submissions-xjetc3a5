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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        // breadth first search
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        queue.append(root)

        while queue.count > 0 {
            let count = queue.count
            
            var temp: [Int] = []
            for _ in 0..<count {
                let node = queue.removeFirst()
                temp.append(node.val)

                if let lNode = node.left { queue.append(lNode) }
                if let rNode = node.right { queue.append(rNode) }
            }

            result.append(temp)
        }

        return result
    }
}
