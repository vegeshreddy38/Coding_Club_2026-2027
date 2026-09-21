\# LeetCode 4056 - Number of Intersecting Interval Pairs I



\## Problem



You are given a 2D integer array `intervals`, where each interval is represented as:



```text

\[start, end]

```



The intervals are \*\*closed\*\*, meaning both endpoints are included.



Return the number of pairs of intervals that intersect.



Two intervals intersect if they have at least one point in common, including when they only share an endpoint.



\## Example 1



Input:



```text

intervals = \[\[1,2],\[2,3],\[3,4]]

```



Output:



```text

2

```



Explanation:



The intersecting pairs are:



```text

\[1,2] and \[2,3]

\[2,3] and \[3,4]

```



They intersect at the endpoints `2` and `3`.



\## Example 2



Input:



```text

intervals = \[\[1,5],\[2,4],\[3,6]]

```



Output:



```text

3

```



Explanation:



All three pairs of intervals intersect.



```text

\[1,5] and \[2,4]

\[1,5] and \[3,6]

\[2,4] and \[3,6]

```



\## Example 3



Input:



```text

intervals = \[\[1,2],\[3,4],\[5,6]]

```



Output:



```text

0

```



Explanation:



None of the intervals intersect.



\## Approach



Use a \*\*brute-force approach\*\* to check every possible pair of intervals.



For each pair:



```text

\[start1, end1]

\[start2, end2]

```



the intervals intersect if:



```text

max(start1, start2) <= min(end1, end2)

```



\### Why does this work?



`max(start1, start2)` gives the starting point of the intersection.



`min(end1, end2)` gives the ending point of the intersection.



If:



```text

intersectionStart <= intersectionEnd

```



then there is at least one common point.



Because the intervals are closed, equality is also considered an intersection.



For example:



```text

\[1,2] and \[2,3]



intersectionStart = max(1,2) = 2

intersectionEnd   = min(2,3) = 2



2 <= 2 → intersect

```



Check every pair using two nested loops and increment the answer whenever the intervals intersect.



\## Time Complexity



\*\*O(n²)\*\*



There are two nested loops that examine every possible pair of intervals.



The number of pairs is approximately:



```text

n × (n - 1) / 2

```



Therefore, the time complexity is \*\*O(n²)\*\*.



\## Space Complexity



\*\*O(1)\*\*



Only a constant number of variables are used apart from the input array.



\## Topics



\* Array

\* Intervals

\* Brute Force

\* Math

\* Range Intersection



\## LeetCode



Problem 4056 - Number of Intersecting Interval Pairs I



