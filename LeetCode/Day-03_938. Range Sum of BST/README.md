\# LeetCode 938 - Range Sum of BST



\## Problem



Given the root of a Binary Search Tree (BST) and two integers `low` and `high`, return the sum of values of all nodes whose values are in the inclusive range `\[low, high]`.



A value is included if:



`low <= node.val <= high`



\## Example 1



Input:

root = \[10,5,15,3,7,null,18]

low = 7

high = 15



Output:

32



Explanation:



The nodes in the range \[7, 15] are:



7, 10, 15



Sum:



7 + 10 + 15 = 32



\## Example 2



Input:

root = \[10,5,15,3,7,13,18,1,null,6]

low = 6

high = 10



Output:

23



Explanation:



The nodes in the range \[6, 10] are:



6, 7, 10



Sum:



6 + 7 + 10 = 23



\## Approach



Use recursion to traverse the Binary Search Tree.



1\. If the current node is `nullptr`, return 0.

2\. Recursively calculate the sum of the left subtree.

3\. Check whether the current node value is within the range `\[low, high]`.

4\. If it is within the range, add its value to the sum.

5\. Recursively calculate the sum of the right subtree.

6\. Return the total sum.



The traversal follows an inorder-style order:



Left → Root → Right



\## Complexity



Time Complexity: O(n)



In the worst case, every node in the tree is visited.



Space Complexity: O(h)



The recursive call stack can contain up to `h` nodes, where `h` is the height of the tree.



In the worst case:



O(n)



\## Topics



\- Binary Search Tree

\- Binary Tree

\- Recursion

\- Depth-First Search



\## LeetCode



Problem 938 - Range Sum of BST

