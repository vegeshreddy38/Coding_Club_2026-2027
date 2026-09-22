/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    int pairSum(ListNode* head) {

        int res=0;

        ListNode*middle=mid(head);
        
        ListNode*temp2=rev(middle);
        ListNode*temp1=head;
        while(temp2){
            res=max(res,temp1->val + temp2->val);
            temp1=temp1->next;
            temp2=temp2->next;
        }

        return res;
    }


    ListNode* mid(ListNode*  head){
        ListNode*slow=head;
        ListNode*fast=head;

        while(fast && fast->next){
            slow=slow->next;
            fast=fast->next->next;
        }
        return slow;
    }

    ListNode*rev(ListNode *head){
        ListNode*temp=head;
        ListNode*front=nullptr;
        ListNode*prev=nullptr;

        while(temp){
            front=temp->next;
            temp->next=prev;
            prev=temp;
            temp=front;

        }
        return prev;
    }
};