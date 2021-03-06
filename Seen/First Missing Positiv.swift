/*
Given an unsorted integer array, find the first missing positive integer.
For example,
Given [1,2,0] return 3,
and [3,4,-1,1] return 2.
*/

class Solution {
    func firstMissingPositive(_ x: [Int]) -> Int {
        var num = 0;
        var i = 0;
        for k in x.sorted() {
            if(k > 0) {
                if(k == num + 1 || k == num) {
                    num = k;
                } else {
                    return (num + 1);
                }
            }
            if(i == x.count-1) {
                return num + 1;
            }
            i += 1;
        }
        return 1;
    }
}
