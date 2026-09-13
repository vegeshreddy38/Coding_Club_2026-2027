\# LeetCode 4052 - Cyclically Shift Rows and Columns



\## Problem



You are given an `n x n` grid and two arrays `rowShift` and `colShift`.



\- `rowShift\[i]` represents the number of positions to cyclically shift the `i`th row to the left.

\- `colShift\[j]` represents the number of positions to cyclically shift the `j`th column upward.



First, shift all rows according to `rowShift`.



Then, shift all columns of the resulting grid according to `colShift`.



Return the resulting grid.



\## Example 1



Input:



n = 2

grid = \[\[1,2],\[3,4]]

rowShift = \[1,0]

colShift = \[0,1]



Output:



\[\[2,4],\[3,1]]



\## Example 2



Input:



n = 3

grid = \[\[1,2,3],\[4,5,6],\[7,8,9]]

rowShift = \[1,2,0]

colShift = \[2,2,1]



Output:



\[\[7,8,5],\[2,3,9],\[6,4,1]]



\## Approach



First, cyclically shift each row to the left.



The `left()` function uses the reversal technique:



1\. Reverse the entire row.

2\. Reverse the first `n-k` elements.

3\. Reverse the last `k` elements.



This produces a cyclic left shift by `k` positions.



After shifting all rows, process each column.



For every column:



1\. Store the first element temporarily.

2\. Move every remaining element one position upward.

3\. Put the stored element at the bottom.

4\. Repeat this process `colShift\[j]` times.



Finally, return the modified grid.



\## Complexity



Time Complexity: O(n³)



For each of the `n` columns, the column may be shifted up to `n` times, and each shift takes O(n).



Row shifting takes O(n²).



Therefore, the overall complexity is O(n³).



Space Complexity: O(1)



The shifting is performed directly on the given grid using only a temporary variable.



\## Topics



\- Arrays

\- Matrix

\- Simulation

\- Cyclic Shift

\- Reversal Algorithm



\## LeetCode



Problem 4052 - Cyclically Shift Rows and Columns

