\# LeetCode 836 - Rectangle Overlap



\## Problem



Given two axis-aligned rectangles represented as:



\[ x1, y1, x2, y2 ]



where:



\- `(x1, y1)` is the bottom-left corner.

\- `(x2, y2)` is the top-right corner.



Return `true` if the two rectangles overlap with a positive area.



If the rectangles only touch at an edge or corner, they do not overlap.



\## Example 1



Input:



rec1 = \[0,0,2,2]

rec2 = \[1,1,3,3]



Output:



true



Explanation:



The two rectangles overlap with a positive area.



\## Example 2



Input:



rec1 = \[0,0,1,1]

rec2 = \[1,0,2,1]



Output:



false



Explanation:



The rectangles only touch at the edge `x = 1`, so there is no positive overlapping area.



\## Example 3



Input:



rec1 = \[0,0,1,1]

rec2 = \[2,2,3,3]



Output:



false



Explanation:



The rectangles do not intersect.



\## Approach



Check whether the two rectangles overlap both horizontally and vertically.



For horizontal overlap:



\- `x1 < X2`

\- `X1 < x2`



For vertical overlap:



\- `y1 < Y2`

\- `Y1 < y2`



If all four conditions are true, the rectangles have a positive intersection area.



Therefore:



```text

x1 < X2 \&\& X1 < x2 \&\& y1 < Y2 \&\& Y1 < y2

