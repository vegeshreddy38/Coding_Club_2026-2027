\# LeetCode 2265 - Count Nodes Equal to Average of Subtree



\## Problem



Given the root of a binary tree, count the number of nodes whose value is equal to the average of the values in its subtree.



The average is calculated as:



Average = Sum of values in the subtree / Number of nodes in the subtree



The result is rounded down to the nearest integer.



\## Example



Input:

\[4,8,5,0,1,null,6]



Output:

5



\## Approach



Use Depth-First Search (DFS).



For every node, calculate:



\- Sum of all values in its subtree

\- Number of nodes in its subtree



The current node is counted if:



sum / count == node value



The sum and count are returned to the parent node.



\## Complexity



Time Complexity: O(n)



Space Complexity: O(h)



where n is the number of nodes and h is the height of the tree.



\## Topics



\- Binary Tree

\- DFS

\- Recursion

\- Tree Traversal



\## LeetCode



Problem 2265 - Count Nodes Equal to Average of Subtree

