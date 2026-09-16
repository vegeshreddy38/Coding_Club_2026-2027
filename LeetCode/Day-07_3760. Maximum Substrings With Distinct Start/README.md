\# LeetCode 3760 - Maximum Substrings With Distinct Start



\## Problem



You are given a string `s` consisting of lowercase English letters.



Return the maximum number of substrings you can split `s` into such that each substring starts with a distinct character.



No two substrings can start with the same character.



\## Example 1



Input:



```text

s = "abab"

```



Output:



```text

2

```



Explanation:



The string can be split into:



```text

"a" + "bab"

```



The substrings start with `'a'` and `'b'`, which are distinct.



Therefore, the answer is `2`.



\## Example 2



Input:



```text

s = "abcd"

```



Output:



```text

4

```



Explanation:



The string can be split into:



```text

"a" + "b" + "c" + "d"

```



All four substrings have different starting characters.



Therefore, the answer is `4`.



\## Example 3



Input:



```text

s = "aaaa"

```



Output:



```text

1

```



Explanation:



All characters are `'a'`, so only one substring can start with `'a'`.



Therefore, the answer is `1`.



\## Approach



The maximum number of substrings is equal to the number of \*\*distinct characters\*\* present in the string.



For example:



```text

s = "abab"

```



The distinct characters are:



```text

a, b

```



So the maximum number of substrings is `2`.



Use an `unordered\_set` to store each unique character.



1\. Traverse the string.

2\. Insert every character into the `unordered\_set`.

3\. Duplicate characters are automatically ignored.

4\. Return the size of the set.



\## Time Complexity



\*\*O(n)\*\*



We traverse the string once.



Each character is inserted into the `unordered\_set`, giving an average O(1) insertion time.



Therefore, the overall time complexity is \*\*O(n)\*\*.



\## Space Complexity



\*\*O(1)\*\*



The string contains only lowercase English letters, so the set can contain at most \*\*26 distinct characters\*\*.



Therefore, the space complexity is \*\*O(1)\*\*.



\## Topics



\* String

\* Hash Table

\* Set

\* Greedy / Observation



\## LeetCode



Problem 3760 - Maximum Substrings With Distinct Start



