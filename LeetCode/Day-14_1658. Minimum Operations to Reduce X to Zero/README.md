\# LeetCode 1658 - Minimum Operations to Reduce X to Zero



\## Problem



You are given an integer array `nums` and an integer `x`.



In one operation, you can remove either the leftmost or the rightmost element from the array and subtract its value from `x`.



Return the minimum number of operations required to reduce `x` exactly to `0`.



If it is not possible, return `-1`.



\## Example 1



Input:



```text

nums = \[1,1,4,2,3]

x = 5

```



Output:



```text

2

```



Explanation:



Remove the last two elements:



```text

3 + 2 = 5

```



Therefore, the answer is `2`.



\## Example 2



Input:



```text

nums = \[5,6,7,8,9]

x = 4

```



Output:



```text

\-1

```



Explanation:



It is not possible to remove elements from the ends such that their sum is exactly `4`.



\## Example 3



Input:



```text

nums = \[3,2,20,1,1,3]

x = 10

```



Output:



```text

5

```



Explanation:



The required elements can be removed from both ends in a total of `5` operations.



\## Approach



Instead of directly finding the elements to remove, find the \*\*longest subarray that can remain\*\*.



Let:



```text

total = sum of all elements

```



If the removed elements must have sum `x`, then the remaining elements must have sum:



```text

target = total - x

```



Therefore, the problem becomes:



> Find the longest contiguous subarray whose sum is `target`.



Since all `nums\[i]` are positive, we can use a \*\*sliding window\*\*.



\### Steps



1\. Calculate the total sum of the array.

2\. Calculate:



```text

target = total - x

```



3\. If `target < 0`, return `-1`.

4\. If `target == 0`, all elements must be removed, so return `n`.

5\. Use two pointers `left` and `right` to maintain a sliding window.

6\. Expand the window by moving `right`.

7\. If the window sum becomes greater than `target`, move `left` forward until the sum is at most `target`.

8\. Whenever the window sum equals `target`, update the longest subarray length.

9\. The minimum number of operations is:



```text

n - longest

```



\### Example



```text

nums = \[1,1,4,2,3]

x = 5



total = 11

target = 11 - 5 = 6

```



The longest subarray with sum `6` is:



```text

\[1,1,4]

```



Its length is `3`.



Therefore:



```text

operations = n - longest

&#x20;          = 5 - 3

&#x20;          = 2

```



\## Time Complexity



\*\*O(n)\*\*



The `right` pointer moves from left to right once, and the `left` pointer also moves forward at most `n` times.



Therefore, the overall time complexity is \*\*O(n)\*\*.



\## Space Complexity



\*\*O(1)\*\*



Only a constant number of variables are used.



No additional array or data structure is required.



\## Topics



\* Array

\* Sliding Window

\* Two Pointers

\* Prefix Sum

\* Subarray



\## LeetCode



Problem 1658 - Minimum Operations to Reduce X to Zero



