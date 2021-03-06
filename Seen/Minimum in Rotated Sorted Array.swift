/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
Find the minimum element.
You may assume no duplicate exists in the array.
*/


class Solution {
    func findMin(_ x: [Int]) -> Int {
        if(x.count==1) {
            return x[0];
        } else if(x.count==2) {
            return (x[0] < x[1]) ? x[0] : x[1];
        }
        let point = findPoint(x, 0, x.count-1);
        if((point == x.count-1 && x[point] < x[point-1]) || point == 0) {
            return x[point];
        } else if(x[point] < x[point-1] && x[point] < x[point-1]) {
            return x[point];
        } else {
            return x[0];
        }
    }
    func findPoint(_ x: [Int],_ start: Int,_ finish: Int) -> Int {
        if(finish - start <= 1) {
            return (x[start] < x[finish]) ? start : finish;
        }
        let middle = (start + finish) / 2;
        if(x[middle] < x[middle-1] && x[middle] < x[middle+1]) {
            return middle;
        }
        let s = abs(x[start] - x[middle]);
        let f = abs(x[middle] - x[finish]);
        return (s >= f) ? findPoint(x, start, middle) : findPoint(x, middle, finish);
    }
}
