\# LeetCode 2130 - Maximum Twin Sum of a Linked List



\## Problem



Given a linked list of even length `n`, the `i`th node is the twin of the `(n - 1 - i)`th node.



The twin sum is the sum of a node and its twin.



Return the maximum twin sum among all pairs.



\## Example 1



Input:



```text

head = \[5,4,2,1]

```



Output:



```text

6

```



Explanation:



The twin pairs are:



```text

5 + 1 = 6

4 + 2 = 6

```



Therefore, the maximum twin sum is `6`.



\## Example 2



Input:



```text

head = \[4,2,2,3]

```



Output:



```text

7

```



Explanation:



The twin pairs are:



```text

4 + 3 = 7

2 + 2 = 4

```



Therefore, the maximum twin sum is `7`.



\## Example 3



Input:



```text

head = \[1,100000]

```



Output:



```text

100001

```



Explanation:



There is only one twin pair:



```text

1 + 100000 = 100001

```



\## Approach



Use the \*\*Fast and Slow Pointer\*\* technique to find the middle of the linked list.



\### Step 1: Find the middle



Use two pointers:



\* `slow` moves one node at a time.

\* `fast` moves two nodes at a time.



When `fast` reaches the end, `slow` reaches the beginning of the second half.



\### Step 2: Reverse the second half



Reverse the linked list starting from `middle`.



For example:



```text

5 → 4 → 2 → 1



Second half:



2 → 1



After reversing:



1 → 2

```



\### Step 3: Calculate twin sums



Now:



```text

First half:          5 → 4

Reversed second:     1 → 2

```



Corresponding nodes are twins:



```text

5 + 1 = 6

4 + 2 = 6

```



Keep track of the maximum sum.



This approach modifies the second half of the linked list but uses no extra array or data structure.



\## Time Complexity



\*\*O(n)\*\*



\* Finding the middle takes O(n).

\* Reversing the second half takes O(n).

\* Calculating the twin sums takes O(n).



Therefore, the overall time complexity is \*\*O(n)\*\*.



\## Space Complexity



\*\*O(1)\*\*



Only a constant number of pointers are used.



No extra array or data structure is required.



Therefore, the space complexity is \*\*O(1)\*\*.



\## Topics



\* Linked List

\* Fast and Slow Pointers

\* Two Pointers

\* Linked List Reversal



\## LeetCode



Problem 2130 - Maximum Twin Sum of a Linked List



