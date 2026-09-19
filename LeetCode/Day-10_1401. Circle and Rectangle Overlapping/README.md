\# LeetCode 1401 - Circle and Rectangle Overlapping



\## Problem



You are given a circle represented by:



```text

(radius, xCenter, yCenter)

```



and an axis-aligned rectangle represented by:



```text

(x1, y1, x2, y2)

```



Return `true` if the circle and rectangle have at least one point in common.



Otherwise, return `false`.



The rectangle is defined by:



\* `(x1, y1)` → bottom-left corner

\* `(x2, y2)` → top-right corner



\## Example 1



Input:



```text

radius = 1

xCenter = 0

yCenter = 0

x1 = 1

y1 = -1

x2 = 3

y2 = 1

```



Output:



```text

true

```



Explanation:



The circle and rectangle share the point `(1,0)`.



\## Example 2



Input:



```text

radius = 1

xCenter = 1

yCenter = 1

x1 = 1

y1 = -3

x2 = 2

y2 = -1

```



Output:



```text

false

```



Explanation:



The closest point of the rectangle to the circle is farther than the circle's radius.



\## Example 3



Input:



```text

radius = 1

xCenter = 0

yCenter = 0

x1 = -1

y1 = 0

x2 = 0

y2 = 1

```



Output:



```text

true

```



Explanation:



The circle and rectangle share points along their boundary.



\## Approach



Find the point on the rectangle that is closest to the center of the circle.



For the x-coordinate:



```text

Xnear = max(x1, min(x2, xCenter))

```



For the y-coordinate:



```text

Ynear = max(y1, min(y2, yCenter))

```



This gives the closest point `(Xnear, Ynear)` on the rectangle to the circle's center.



Then calculate the squared distance between the circle's center and this point:



```text

distanceSquared =

&#x20;   (Xnear - xCenter)² +

&#x20;   (Ynear - yCenter)²

```



If:



```text

distanceSquared <= radius²

```



then the circle and rectangle overlap.



We compare squared distances instead of calculating the actual distance using `sqrt()`, which avoids unnecessary floating-point calculations.



\## Time Complexity



\*\*O(1)\*\*



Only a fixed number of `min`, `max`, multiplication, and comparison operations are performed.



\## Space Complexity



\*\*O(1)\*\*



Only a constant number of variables are used.



\## Topics



\* Geometry

\* Math

\* Coordinate System

\* Circle

\* Rectangle

\* Distance



\## LeetCode



Problem 1401 - Circle and Rectangle Overlapping



