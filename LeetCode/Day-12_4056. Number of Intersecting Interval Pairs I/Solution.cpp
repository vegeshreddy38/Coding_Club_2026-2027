class Solution {
public:
    int countIntersectingIntervals(vector<vector<int>>& intervals) {

        int n = intervals.size();
        int res = 0;

        for (int i = 0; i < n - 1; i++) {

            int a = intervals[i][0];
            int b = intervals[i][1];

            for (int j = i + 1; j < n; j++) {

                int l1 = intervals[j][0];
                int l2 = intervals[j][1];

                if (max(a, l1) <= min(b, l2)) {
                    res++;
                }
            }
        }

        return res;
    }
};