class Solution {
public:
    bool checkOverlap(int radius, int xCenter, int yCenter,
                      int x1, int y1, int x2, int y2) {

        int Xnear = max(x1, min(x2, xCenter));
        int Ynear = max(y1, min(y2, yCenter));

        int dx = Xnear - xCenter;
        int dy = Ynear - yCenter;

        int distanceSquared = dx * dx + dy * dy;

        return distanceSquared <= radius * radius;
    }
};