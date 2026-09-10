/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */


class Solution {
public:
    int averageOfSubtree(TreeNode* root) {
        int res=0;
        dfs(root,res);
        return res;        
    }

    pair<int,int> dfs(TreeNode*root,int &res){
        if(root == nullptr)
           return {0,0};
        
        auto lef=dfs(root->left,res);
        auto rig=dfs(root->right,res);

        int sum=lef.first+rig.first+root->val;
        int cnt=lef.second+rig.second+1;

        if(sum / cnt == root->val)
            res++;
        
        return {sum,cnt};
    }
};
