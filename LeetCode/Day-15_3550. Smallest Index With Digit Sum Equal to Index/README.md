\# LeetCode 3550 - Smallest Index With Digit Sum Equal to Index



\## Problem



You are given an integer array `nums`.



Return the \*\*smallest index `i`\*\* such that the sum of the digits of `nums\[i]` is equal to `i`.



If no such index exists, return `-1`.



\### Example 1



```text

Input: nums = \[1,3,2]

Output: 2

```



\*\*Explanation:\*\*



For `nums\[2] = 2`, the sum of digits is `2`, which is equal to index `2`.



Therefore, the answer is `2`.



\### Example 2



```text

Input: nums = \[1,10,11]

Output: 1

```



\*\*Explanation:\*\*



\* `nums\[1] = 10` → digit sum = `1 + 0 = 1`

\* `nums\[2] = 11` → digit sum = `1 + 1 = 2`



Both indices satisfy the condition, but index `1` is the smallest.



Therefore, the answer is `1`.



\### Example 3



```text

Input: nums = \[1,2,3]

Output: -1

```



\*\*Explanation:\*\*



No index has a digit sum equal to its index, so the answer is `-1`.



\---



\## Approach



1\. Traverse the array from left to right.

2\. For every index `i`, calculate the digit sum of `nums\[i]`.

3\. Extract each digit using:



&#x20;  ```cpp

&#x20;  num % 10

&#x20;  ```

4\. Remove the last digit using:



&#x20;  ```cpp

&#x20;  num /= 10

&#x20;  ```

5\. If the digit sum is equal to the current index:



&#x20;  ```cpp

&#x20;  if(sum == i)

&#x20;      return i;

&#x20;  ```

6\. Since we traverse from the smallest index to the largest, the first valid index is automatically the smallest.

7\. If no valid index is found, return `-1`.



\---



\## Time Complexity



\*\*O(n × d)\*\*



Where:



\* `n` = number of elements in `nums`

\* `d` = number of digits in each number



Since `nums\[i] <= 1000`, each number has at most 4 digits, so this is effectively \*\*O(n)\*\*.



\---



\## Space Complexity



\*\*O(1)\*\*



Only a few integer variables are used, so no additional data structure is required.



\---



\## Topics



\* Array

\* Math

\* Digit Manipulation



\## LeetCode



\[3550. Smallest Index With Digit Sum Equal to Index](https://leetcode.com/problems/smallest-index-with-digit-sum-equal-to-index/)



