class Solution {
public:
    int reverseDegree(string s) {

        int n = s.length();
        int res = 0;

        for (int i = 0; i < n; i++) {
            int k = 26 - (s[i] - 'a');
            res += k * (i + 1);
        }

        return res;
    }
};