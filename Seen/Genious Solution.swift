/*
Trvac e massiv u mi tiv; petq e veradardznel 
elementneri ayn 4-jaknery(aranc krknutyan :D)
voronc gumary = trvac tvin: 
*/

class Solution {
    func check(_ result: [[Int]], _ a: [Int]) -> Bool {
        for x in result {
            if(x==a) {
                return false;
            }
        } 
        return true;
    }
    func fourSum(_ x: [Int], _ target: Int) -> [[Int]] {
        if(x.count < 4) {
            return [[Int]]();
        }
        var result = [[Int]]();
        for i in 0...x.count-4 {
            for j in i+1...x.count-3 {
                for k in j+1...x.count-2 {
                    for m in k+1...x.count-1 {
                        let h=x[i]+x[j]+x[k]+x[m];
                        if(h==target) {
                            var c: [Int] = [x[i], x[j], x[k], x[m]];
                            c.sort();
                            if(check(result, c)) {
                                result.append(c);
                            }
                        }
                    }
                }
            }
        }
        return result;
    }
}
