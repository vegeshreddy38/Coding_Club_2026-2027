\# LeetCode 3498 - Reverse Degree of a String



\## Problem



Given a string `s`, calculate its \*\*reverse degree\*\*.



For every character:



1\. Find its position in the reversed alphabet.

2\. Multiply that value by its position in the string, using 1-based indexing.

3\. Add all the products together.



The reversed alphabet positions are:



```text

a = 26

b = 25

c = 24

...

y = 2

z = 1

```



\## Example 1



Input:



```text

s = "abc"

```



Output:



```text

148

```



Explanation:



```text

a → 26 × 1 = 26

b → 25 × 2 = 50

c → 24 × 3 = 72

```



Therefore:



```text

26 + 50 + 72 = 148

```



\## Example 2



Input:



```text

s = "zaza"

```



Output:



```text

160

```



Explanation:



```text

z → 1 × 1 = 1

a → 26 × 2 = 52

z → 1 × 3 = 3

a → 26 × 4 = 104

```



Therefore:



```text

1 + 52 + 3 + 104 = 160

```



\## Approach



Traverse the string from left to right.



For each character `s\[i]`:



1\. Calculate its normal alphabet position using:



```text

s\[i] - 'a'

```



2\. Convert it to the reversed alphabet position:



```text

26 - (s\[i] - 'a')

```



3\. Multiply it by the 1-indexed position:



```text

(26 - (s\[i] - 'a')) \* (i + 1)

```



4\. Add the result to the total.



For example:



```text

s = "abc"



a → 26 - 0 = 26

b → 26 - 1 = 25

c → 26 - 2 = 24

```



Then multiply each value by its position in the string.



\## Time Complexity



\*\*O(n)\*\*



We traverse every character of the string exactly once.



\## Space Complexity



\*\*O(1)\*\*



Only a constant number of variables are used.



\## Topics



\* String

\* ASCII Values

\* Math

\* Character Manipulation



\## LeetCode



Problem 3498 - Reverse Degree of a String



