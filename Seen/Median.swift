/*

There are two sorted arrays nums1 and nums2 of size m and n respectively.
Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]
The median is 2.0

Example 2:
nums1 = [1, 2]
nums2 = [3, 4]
The median is (2 + 3)/2 = 2.5

*/

class Solution {
    func findMedianSortedArrays(_ x: [Int], _ y: [Int]) -> Double {
        var i = 0;
        var j = 0;
        var arr = [Int]();
        while(i != x.count && j != y.count) {
            if(x[i] < y[j]) {
                arr.append(x[i]);
                i += 1;
            } else {
                arr.append(y[j]);
                j += 1;
            }
        }
        while(i != x.count) {
            arr.append(x[i]);
            i += 1;
        }
        while(j != y.count) {
            arr.append(y[j]);
            j += 1;
        }
        print(arr);
        if(arr.count % 2 == 1) {
            return Double(arr[arr.count/2]);
        } else {
            return Double((arr[arr.count/2 - 1] + arr[arr.count/2])) / 2;
        }
    }
}
