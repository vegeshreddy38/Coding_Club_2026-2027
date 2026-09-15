\# LeetCode 4048 - Count Values With Equally Spaced Occurrences I



\## Problem



You are given an integer array `nums`.



An integer `x` is called special if:



\* `x` appears exactly three times in `nums`.

\* All three occurrences of `x` are equally spaced in the array.



If the three occurrences are at indices:



`i1 < i2 < i3`



then `x` is special if:



`i2 - i1 == i3 - i2`



Return the number of distinct special integers in `nums`.



\## Example 1



Input:



```text

nums = \[1,8,1,5,1,5,8,5]

```



Output:



```text

2

```



Explanation:



`1` occurs at indices `\[0,2,4]`.



```text

2 - 0 = 2

4 - 2 = 2

```



Therefore, `1` is special.



`5` occurs at indices `\[3,5,7]`.



```text

5 - 3 = 2

7 - 5 = 2

```



Therefore, `5` is also special.



`8` occurs only twice, so it is not special.



Therefore, the answer is `2`.



\## Example 2



Input:



```text

nums = \[8,8,8,8]

```



Output:



```text

0

```



Explanation:



`8` occurs four times, not exactly three times.



Therefore, it is not special.



\## Example 3



Input:



```text

nums = \[8,6,6,8,8]

```



Output:



```text

0

```



Explanation:



`8` occurs at indices `\[0,3,4]`.



```text

3 - 0 = 3

4 - 3 = 1

```



The differences are not equal, so `8` is not special.



`6` occurs only twice.



Therefore, the answer is `0`.



\## Approach



Use an `unordered\_map` to store the indices of every distinct number.



1\. Traverse the array and store each index in the hash map.

2\. Each number is mapped to a vector containing all its occurrence indices.

3\. Check every distinct number in the map.

4\. If a number occurs exactly three times, get its three indices.

5\. Check whether the three occurrences are equally spaced.

6\. If:



```text

index\[1] - index\[0] == index\[2] - index\[1]

```



then the number is special.

7\. Increment the result.



For example:



```text

nums = \[1,8,1,5,1,5,8,5]



1 → \[0,2,4]

5 → \[3,5,7]

8 → \[1,6]

```



Both `1` and `5` have equally spaced occurrences, so the answer is `2`.



\## Time Complexity



\*\*O(n)\*\*



We traverse the array once to store the indices.



Then we iterate through the distinct values and check their stored indices.



Since every index is stored and examined only a constant number of times, the overall complexity is \*\*O(n)\*\*.



\## Space Complexity



\*\*O(n)\*\*



The `unordered\_map` stores the indices of all elements.



In the worst case, all `n` elements are stored in the map, so the space complexity is \*\*O(n)\*\*.



\## Topics



\* Array

\* Hash Table

\* Vector

\* Index Tracking

\* Arithmetic Progression



\## LeetCode



Problem 4048 - Count Values With Equally Spaced Occurrences I



