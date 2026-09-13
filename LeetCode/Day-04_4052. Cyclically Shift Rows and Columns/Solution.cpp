class Solution {
public:
    vector<vector<int>> cyclicShift(int n, vector<vector<int>>& grid, vector<int>& rowShift, vector<int>& colShift) {

        for (int i = 0; i < n; i++) {
            left(grid[i], rowShift[i], n);
        }

        for (int j = 0; j < n; j++) {

            for (int k = 0; k < colShift[j]; k++) {

                int t = grid[0][j];

                for (int i = 0; i < n - 1; i++) {
                    grid[i][j] = grid[i + 1][j];
                }

                grid[n - 1][j] = t;
            }
        }

        return grid;
    }

    void left(vector<int>& a, int k, int n) {

        rev(a, 0, n - 1);
        rev(a, 0, n - k - 1);
        rev(a, n - k, n - 1);
    }

    void rev(vector<int>& a, int start, int end) {

        while (start < end) {
            swap(a[start], a[end]);

            start++;
            end--;
        }
    }
};