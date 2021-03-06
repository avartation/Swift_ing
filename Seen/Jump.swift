/*
Sra lucumnel em nayel, because
imy TimeLimit-ic ancnum er:


Given an array of non-negative integers, you are initially positioned at the first index of the array.
Each element in the array represents your maximum jump length at that position.
Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.
A = [3,2,1,0,4], return false.
*/

class Solution {
    func canJump(_ x: [Int]) -> Bool {
        var minStartPoint = x.count - 1;
        var i=minStartPoint - 1;
        while(i >= 0) {
            minStartPoint = ((i + x[i]) >= minStartPoint) ? i : minStartPoint;
            i-=1;
        }
        return minStartPoint == 0;
    }
}
