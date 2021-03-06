/*
Trvac en 4 array;
Petq e gtnel ayn bolor 
(i,j,k,l) havaqacuneri qanaky,
vor { A[i] + B[j] + C[k] + D[l] == 0 } 
Chisht a lucumy nayel em, 
bayc eli charcharveci mi qich :D
Ev verjapes che vor menq zargacnum enq Swift Skill-ery :D
*/

class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var count = 0;
        var x1 = [Int: Int]();
        var x2 = [Int: Int]();
        for i in A {
            for j in B {
                if x1[i+j] != nil {
                    x1[i+j]! += 1;
                } else {
                    x1[i+j] = 1;
                }
            }
        }
        for i in C {
            for j in D {
                if x2[i+j] != nil {
                    x2[i+j]! += 1;
                } else {
                    x2[i+j] = 1;
                }
            }
        }
        for i in x1.keys {
            if x2[-i] != nil {
                count += (x1[i]!*x2[-i]!);
            }
        }
        return count;
    }
}
