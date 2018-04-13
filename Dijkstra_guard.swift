func checkIfNotVisited(_ visited: [Int: Bool]) -> [Int] {
    var notVisited = [Int]();
    for i in visited.keys {
        guard let visited_i = visited[i] else { continue }
        if(!visited_i) {
            notVisited.append(i);
        }
    }
    return notVisited;
}
func findMin(_ current: [Int],_ res: [Int: [Int]]) -> Int {
    var min = current[0];
    for k in current {
        guard let res_k = res[k], let res_min = res[min] else { continue }
        if(res_k[0] != -1 && res_k[0] < res_min[0]) {
            min = k;
        }
    }
    return min;
}
func makeCurrent(_ keys: [Int],_ visited: [Int: Bool]) -> [Int] {
    var current = [Int]();
    for k in keys {
        guard let visited_k = visited[k] else { continue }
        if(!visited_k) {
            current.append(k);
        }
    }
    return current;
}
func Dijkstra(_ x: [Int: [Int: Int]]) {
    var current = [Int]([x.keys.sorted()[0]]);
    var visited = Dictionary(uniqueKeysWithValues: zip(x.keys,
                                                   Array(repeating: false, count: x.count)));
    var res = Dictionary(uniqueKeysWithValues: zip(x.keys,
                                                   Array(repeating: [-1, -1], count: x.count)));
    res[x.keys.sorted()[0]]?[0] = 0;
    var notVisited = checkIfNotVisited(visited);
    while(!notVisited.isEmpty) {
        var vertex = findMin(current, res);
        guard let x_vertex = x[vertex] else { continue }
        for k in x_vertex.keys {
            guard res[k] != nil && res[vertex] != nil && x_vertex[k] != nil else { continue }
            if(res[k]![0] == -1) {
                res[k]![0] = res[vertex]![0] + x_vertex[k]!;
                res[k]![1] = vertex;
            } else {
                let dist = res[vertex]![0] + x_vertex[k]!;
                if(dist < res[k]![0]) {
                    res[k]![0] = dist;
                    res[k]![1] = vertex;
                }
            }
        }
        current = makeCurrent([Int](x_vertex.keys), visited);
        visited[vertex]? = true;
        notVisited = checkIfNotVisited(visited);
    }
    print(res);
}

/******* Testing ******/

var x = [
    1: [2: 6, 4: 1], 
    2: [1: 6, 4: 2, 5: 2, 3: 5], 
    3: [2: 5, 5: 5], 
    4: [1: 1, 2: 2, 5: 1],
    5: [2: 2, 3: 5, 4: 1]
];

Dijkstra(x);
