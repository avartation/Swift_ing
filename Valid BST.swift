/*
Given a binary tree, determine if it is a valid binary search tree (BST)

Example 1:
    2
   / \
  1   3
Binary tree [2,1,3], return true.

Example 2:
    1
   / \
  2   3
Binary tree [1,2,3], return false.
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    enum Direction {
        case LEFT
        case RIGHT
    }
    
    func findMaxInTree(_ root: TreeNode?) -> Int? {
        guard let root = root else { return nil }
        if let maxLeft = findMaxInTree(root.left) {
            if let maxRight = findMaxInTree(root.right) {
                if maxLeft > maxRight {
                    return (maxLeft > root.val) ? maxLeft : root.val
                }
                else {
                    return (maxRight > root.val) ? maxRight : root.val            
                }
            }
            else {
                return (maxLeft > root.val) ? maxLeft : root.val
            }
        }
        else if let maxRight = findMaxInTree(root.right) {
            return (maxRight > root.val) ? maxRight : root.val
        }
        else {
            return root.val
        }
    }
    
    func findMinInTree(_ root: TreeNode?) -> Int? {
        guard let root = root else { return nil }
        if let minLeft = findMinInTree(root.left) {
            if let minRight = findMinInTree(root.right) {
                if minLeft < minRight {
                    return (minLeft < root.val) ? minLeft : root.val
                }
                else {
                    return (minRight < root.val) ? minRight : root.val            
                }
            }
            else {
                return (minLeft < root.val) ? minLeft : root.val
            }
        }
        else if let minRight = findMinInTree(root.right) {
            return (minRight < root.val) ? minRight : root.val
        }
        else {
            return root.val
        }
    }
   
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let maxLeft = findMaxInTree(root.left)
        let minRight = findMinInTree(root.right)
        if let maxLeft = maxLeft, let minRight = minRight {
            if maxLeft >= root.val || minRight <= root.val {
                return false
            }
        }
        else if let maxLeft = maxLeft {
            if maxLeft >= root.val {
                return false
            }
        }
        else if let minRight = minRight {
            if minRight <= root.val {
                return false
            }
        }
        else {
            return true
        }
        return isValidBST(root.left) && isValidBST(root.right)
    }
}
