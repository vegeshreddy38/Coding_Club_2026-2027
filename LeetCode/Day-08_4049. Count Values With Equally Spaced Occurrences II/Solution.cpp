class Solution {
public:
    int countSpecialIntegers(vector<int>& nums) {

        int n=nums.size();

        unordered_map<int,vector<int>>mp;

        for(int i=0;i<n;i++){
            mp[nums[i]].push_back(i);
        }

        int res=0;

        for(auto it : mp){
            if(it.second.size() < 3){
                continue;
            }

            int k=it.second[1]-it.second[0];

            bool is_Special=true;
            for(int i=2;i<it.second.size();i++){
                if(it.second[i]-it.second[i-1]  != k){
                    is_Special=false;
                    break;
                }
            }

            if(is_Special)
               res++;

        }
        return res;
        
    }
};