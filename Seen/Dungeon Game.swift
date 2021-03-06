/*
Es algorithy chyndunec time-limit-i
patcharov, bayc chisht a logikan.
Urishneri lucumnernel em nayel,
nranov el kgrem( yndex iranq hakarak 
uxxutyamb en galis);

The demons had captured the princess (P)
 and imprisoned her in the bottom-right corner of a 
dungeon. The dungeon consists of M x N rooms laid out 
in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room
 and must fight his way through the dungeon to rescue the princess.
The knight has an initial health point represented by a positive integer. 
If at any point his health point drops to 0 or below, he dies immediately.
Some of the rooms are guarded by demons, so the knight loses 
health (negative integers) upon entering these rooms; 
other rooms are either empty (0's) or contain magic orbs 
that increase the knight's health (positive integers).
In order to reach the princess as quickly as possible, 
the knight decides to move only rightward or downward in each step.

For example, given the dungeon below, 
the initial health of the knight must be 
at least 7 if he follows the optimal path 
RIGHT-> RIGHT -> DOWN -> DOWN.

-2 (K)	-3	3

-5	-10	1

10	30	-5 (P)

*/

class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        var start_health = dungeon[0][0];
        if(start_health <= 0) {
            start_health = 1 - start_health;
        } else {
            start_health = 1;
        }
        return shorter(dungeon, 0, 0, start_health, start_health + dungeon[0][0]);
    }
    func shorter(_ x: [[Int]],_ i: Int,_ j: Int,_ health: Int,_ current_health: Int) -> Int {
        if(i==x.count-1 && j==x[0].count-1) {
            return health;
        }
        if(i < x.count-1 && j < x[0].count-1) {
            var current_health_1 = current_health;
            var current_health_2 = current_health;
            var health_right = current_health;
            var health_down = current_health;
            health_right += x[i][j+1];
            health_down += x[i+1][j];
            if(health_right <= 0) {
                health_right = health + 1 - health_right;
                current_health_1 = 1;
            } else {
                health_right = health;
                current_health_1 += x[i][j+1];
            }
            if(health_down <= 0) {
                health_down = health + 1 - health_down;
                current_health_2 = 1;
            } else {
                health_down = health;
                current_health_2 += x[i+1][j];
            }
            health_right = shorter(x, i, j+1, health_right, current_health_1);
            health_down = shorter(x, i+1, j, health_down, current_health_2);
            if(health_right < health_down) {
                return health_right;
            } else {
                return health_down;
            }
        } else if(i < x.count-1) {
            var current_health_2 = current_health;
            var health_down = current_health;
            health_down += x[i+1][j];
            if(health_down <= 0) {
                health_down = health + 1 - health_down;
                current_health_2 = 1;
            } else {
                health_down = health;
                current_health_2 += x[i+1][j];
            }
            return shorter(x, i+1, j, health_down, current_health_2);
        } else {
            var current_health_1 = current_health;
            var health_right = current_health;
            health_right += x[i][j+1];
            if(health_right <= 0) {
                health_right = health + 1 - health_right;
                current_health_1 = 1;
            } else {
                health_right = health;
                current_health_1 += x[i][j+1];
            }
            return shorter(x, i, j+1, health_right, current_health_1);
        }
    }
}
