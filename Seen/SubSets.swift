/*

Given a set of distinct integers, nums, return all possible subsets (the power set).
Note: The solution set must not contain duplicate subsets.

For example,
If nums = [1,2,3], a solution is:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]

*/

class Solution {
    func subsets(_ x: [Int]) -> [[Int]] {
        var result=[[Int]]();
        for n in 0...x.count {
            res = [];
            generate(x, [], n, -1);
            result += res;
        }
        return result;
    }
    var res = [[Int]]();
    func generate(_ x: [Int], _ arr: [Int], _ n: Int, _ i: Int) {
        if(arr.count == n) {
            res.append(arr);
            return;
        }
        if(i == (x.count - 1)) {
            return;
        }
        for j in (i + 1)..<x.count {
            var cur = arr;
            cur.append(x[j]);
            generate(x, cur, n, j);
        }
    }
}
