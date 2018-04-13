/*
Amenamoshni xndirna vor Swift-ov lucel em!
Ahagin charcharveci-ban,...minchev chisht 
vorosheci (dict)-i Collection Type-y:


You are given an integer array sorted in 
ascending order (may contain duplicates), 
you need to split them into several subsequences, 
where each subsequences consist of 
at least 3 consecutive integers. 
Return whether you can make such a split.

Example 1:
Input: [1,2,3,3,4,5]
Output: True

Explanation:
You can split them into two consecutive subsequences : 
1, 2, 3
3, 4, 5


Example 2:
Input: [1,2,3,3,4,4,5,5]
Output: True

Explanation:
You can split them into two consecutive subsequences : 
1, 2, 3, 4, 5
3, 4, 5


Example 3:
Input: [1,2,3,4,4,5]
Output: False
*/


class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var dict=[Int:[Int]]();
        for num in nums {
            if(dict[num - 1] != nil) {
                if(dict[num] != nil) {
                    (dict[num]!).append((dict[num-1]!)[0] + 1);
                    (dict[num]!).sort();
                } else {
                    dict[num] = [Int]();
                    (dict[num]!).append((dict[num - 1]!)[0] + 1);
                }
                (dict[num - 1]!).remove(at: 0);
                if((dict[num - 1]!).isEmpty) {
                    dict[num - 1] = nil;
                }
            } else {
                if(dict[num] != nil) {
                    (dict[num]!).append(1);
                    (dict[num]!).sort();
                } else {
                    dict[num] = [Int]();
                    (dict[num]!).append(1);
                }
            }
        }
        for i in dict.keys {
            for x in dict[i]! {
                if(x < 3) {
                    return false;
                }
            }
        }
        return true;
    }
}
