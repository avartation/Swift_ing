/*
Shaaaaat moshni xndir er :D, dzec

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
You are given a target value to search. If found in the array return its index, otherwise return -1.
You may assume no duplicate exists in the array.
*/

class Solution {
    func binarySearch(_ x: [Int],_ start: Int,_ finish: Int,_ key: Int) -> Int {
        if(start == finish) {
            return (x[start] == key) ? start: -1;
        }
        let middle = (start + finish) / 2;
        if(x[middle] == key) {
            return middle;
        } else if(key < x[middle]) {
            return binarySearch(x, start, middle, key);
        } else {
            return binarySearch(x, middle+1, finish, key);
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
    func search(_ x: [Int], _ key: Int) -> Int {
        if(x.count==0) {
            return -1;
        } else if(x.count==1) {
            return (x[0] == key) ? 0 : -1;
        } else if(x.count==2) {
            if(x[0]==key) {
                return 0;
            } else if(x[1]==key) {
                return 1;
            } else {
                return -1;
            }
        }
        var point = findPoint(x, 0, x.count-1);
        if(point==0) {
            return binarySearch(x, 0, x.count-1, key);
        }
        var res = binarySearch(x, 0, point-1, key);
        return (res == -1) ? binarySearch(x, point, x.count-1, key) : res;
    }
}
