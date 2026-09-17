\# LeetCode 4049 - Count Values With Equally Spaced Occurrences II



\## Problem



You are given an integer array `nums`.



An integer `x` is called special if:



\* `x` appears at least three times in `nums`.

\* All occurrences of `x` are equally spaced in the array.



If the occurrences are at indices:



```text

i1 < i2 < i3 < ... < im

```



then `x` is special if:



```text

i2 - i1 = i3 - i2 = ... = im - i(m-1)

```



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



`1` occurs at indices:



```text

\[0,2,4]

```



The differences are:



```text

2 - 0 = 2

4 - 2 = 2

```



Therefore, `1` is special.



`5` occurs at indices:



```text

\[3,5,7]

```



The differences are:



```text

5 - 3 = 2

7 - 5 = 2

```



Therefore, `5` is also special.



So the answer is `2`.



\## Example 2



Input:



```text

nums = \[8,8,8,8]

```



Output:



```text

1

```



Explanation:



`8` occurs at indices:



```text

\[0,1,2,3]

```



The differences are:



```text

1 - 0 = 1

2 - 1 = 1

3 - 2 = 1

```



All occurrences are equally spaced, so `8` is special.



Therefore, the answer is `1`.



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



`8` occurs at indices:



```text

\[0,3,4]

```



The differences are:



```text

3 - 0 = 3

4 - 3 = 1

```



The differences are not equal, so `8` is not special.



`6` occurs only twice.



Therefore, the answer is `0`.



\## Approach



Use an `unordered\_map` to store the indices of every distinct number.



1\. Traverse the array and store the index of each number.

2\. Check every distinct number in the map.

3\. If it occurs fewer than three times, skip it.

4\. Calculate the difference between the first two occurrence indices.

5\. Store this difference as the required spacing.

6\. Check every remaining consecutive pair of occurrence indices.

7\. If any difference is different from the required spacing, the number is not special.

8\. If all differences are equal, increment the answer.



For example:



```text

nums = \[1,8,1,5,1,5,8,5]



1 → \[0,2,4]

5 → \[3,5,7]

8 → \[1,6]

```



For `1`:



```text

2 - 0 = 2

4 - 2 = 2

```



For `5`:



```text

5 - 3 = 2

7 - 5 = 2

```



Both are special.



\## Time Complexity



\*\*O(n)\*\*



We traverse the array once to build the hash map.



Then we examine the occurrence indices of each distinct value. Across all values, there are at most `n` stored indices.



Therefore, the overall time complexity is \*\*O(n)\*\* on average.



\## Space Complexity



\*\*O(n)\*\*



The hash map stores every element's occurrence index.



In the worst case, all `n` elements are stored, so the space complexity is \*\*O(n)\*\*.



\## Topics



\* Array

\* Hash Table

\* Vector

\* Index Tracking

\* Arithmetic Progression

\* Enumeration



\## LeetCode



Problem 4049 - Count Values With Equally Spaced Occurrences II



