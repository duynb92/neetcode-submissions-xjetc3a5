/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var cur = dummy
        var a = list1
        var b = list2

        while a != nil && b != nil {
            if a!.val < b!.val {
                cur.next = a
                a = a!.next 
            } else {
                cur.next = b
                b = b!.next
            }
            cur = cur.next!
        }

        cur.next = a ?? b

        return dummy.next
    }
}
