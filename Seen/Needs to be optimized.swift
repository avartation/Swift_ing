/*
trvac e array u k tiv;
petq e veradardznel amenahachax
handipvox k hat tvery;
(k-n mish <= ezaki tveri qanakic, valid e)
*/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result=[Int: Int]();
        for i in nums {
            if result[i] != nil {
                result[i]! += 1;
            } else {
                result[i] = 1;
            }
        }
        var arr=[(Int,Int)]();
        for i in result.keys {
            arr.append((i, result[i]!));
        }
        arr.sort(by: { (x1, x2) in return x1.1 > x2.1 });
        var real=[Int]();
        for i in 0..<k {
            real.append(arr[i].0);
        }
        return real;
    }
}
