\# LeetCode 1 - Two Sum



\## Problem



You are given an array of integers `nums` and an integer `target`.



Return the indices of the two numbers whose sum is equal to `target`.



You may not use the same element twice.



Each input has exactly one valid solution.



\## Example 1



Input:



```text

nums = \[2,7,11,15]

target = 9

```



Output:



```text

\[0,1]

```



Explanation:



```text

nums\[0] + nums\[1]

= 2 + 7

= 9

```



Therefore, the answer is `\[0,1]`.



\## Example 2



Input:



```text

nums = \[3,2,4]

target = 6

```



Output:



```text

\[1,2]

```



Explanation:



```text

2 + 4 = 6

```



\## Example 3



Input:



```text

nums = \[3,3]

target = 6

```



Output:



```text

\[0,1]

```



Explanation:



```text

3 + 3 = 6

```



The two elements are at different indices, so they can be used.



\## Approach



Use an `unordered\_map` to store each number and its index while traversing the array.



For every element:



1\. Calculate the required value:



```text

remaining = target - nums\[i]

```



2\. Check whether `remaining` already exists in the hash map.

3\. If it exists, the two numbers add up to `target`.

4\. Return the stored index of `remaining` and the current index.

5\. If it does not exist, store the current number and its index in the map.

6\. Continue until the pair is found.



For example:



```text

nums = \[2,7,11,15]

target = 9



2 → remaining = 7 → not found → store 2

7 → remaining = 2 → found → return \[0,1]

```



This avoids checking every possible pair and gives an average O(n) solution.



\## Time Complexity



\*\*O(n)\*\* average



We traverse the array once.



Hash map insertion and lookup take \*\*O(1)\*\* average time.



Therefore, the overall average time complexity is \*\*O(n)\*\*.



\## Space Complexity



\*\*O(n)\*\*



In the worst case, we may store almost all elements in the hash map before finding the answer.



Therefore, the space complexity is \*\*O(n)\*\*.



\## Topics



\* Array

\* Hash Table

\* Two Sum

\* Searching



\## LeetCode



Problem 1 - Two Sum



