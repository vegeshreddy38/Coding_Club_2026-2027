\# LeetCode 3483 - Unique 3-Digit Even Numbers



\## Problem



You are given an array of digits. The task is to determine the number of distinct three-digit even numbers that can be formed using these digits.



Each copy of a digit can be used only once in a number.



A three-digit number cannot start with zero.



The last digit must be even.



\## Example 1



Input:

digits = \[1,2,3,4]



Output:

12



\## Example 2



Input:

digits = \[0,2,2]



Output:

2



The numbers are:



202

220



\## Approach



Use three nested loops to choose the three digits.



\- The first digit cannot be zero because the number must have three digits.

\- The second digit can be any remaining digit.

\- The third digit must be even.

\- The same array position cannot be used more than once.

\- Use an `unordered\_set` to store the generated numbers so that duplicate numbers are counted only once.



For example, if the input contains two copies of digit `2`, both can be used in the same number.



\## Complexity



Time Complexity: O(n³)



There are three nested loops, where n is the number of digits.



Space Complexity: O(k)



The unordered\_set stores the distinct three-digit numbers.



\## Topics



\- Arrays

\- Hash Set

\- Enumeration

\- Permutations



\## LeetCode



Problem 3483 - Unique 3-Digit Even Numbers

