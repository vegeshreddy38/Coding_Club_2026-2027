class Solution {
public:
    int countSpecialIntegers(vector<int>& nums) {

        int res = 0;

        unordered_map<int, vector<int>> mp;

        // Store all indices where each value occurs
        for (int i = 0; i < nums.size(); i++) {
            mp[nums[i]].push_back(i);
        }

        // Check each distinct value
        for (auto it : mp) {

            // It must occur exactly 3 times
            if (it.second.size() == 3) {

                // Check equal spacing
                if (it.second[1] - it.second[0] ==
                    it.second[2] - it.second[1]) {
                    res++;
                }
            }
        }

        return res;
    }
};