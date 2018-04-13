/****************** Classes and all the stuff needed ******************/

class Given {
    let x: [Int: [Int: Int]]
    init(_ _x: [Int: [Int: Int]]) {
        x = _x;
    }
    var count: Int {
        return x.count;
    }
    var vertexes: [Int] {
        return x.keys.sorted();
    }
    func directions(of vertex: Int) -> [Int]? {
        guard let vertex = x[vertex] else { return nil }
        return vertex.keys.sorted();
    }
    func getDist(from: Int, to: Int) -> Int? {
        guard let vertex = x[from] else { return nil }
        guard let dist = vertex[to] else { return nil }
        return dist;
    }
}
class Result {
    var res: [Int: (Int, Int)] = [:];
    init(_ vertexes: [Int]) {
        res[vertexes[0]] = (0, -1);
        for i in 1..<vertexes.count {
            res[vertexes[i]] = (-1, -1);
        }
    }
    func getDist(of vertex: Int) -> Int? {
        guard let vert = res[vertex] else { return nil }
        return vert.0;
    }
    func setDist(of vertex: Int, newValue: Int) {
        if(res[vertex] != nil) {
            res[vertex]?.0 = newValue;
        }
    }
    func getFrom(of vertex: Int) -> Int? {
        guard let vert = res[vertex] else { return nil }
        return vert.1;
    } 
    func setFrom(of vertex: Int, newValue: Int) {
        if(res[vertex] != nil) {
            res[vertex]?.1 = newValue;
        }
    }
    func show() {
        print("Vertex: Dist, From");
        for vertex in res.keys.sorted() {
            guard let dist = getDist(of: vertex), let from = getFrom(of: vertex) else { return }
            print("\(vertex):      \(dist),    \(from)");
        }
    }
}
class Visited {
    var visited: [Int: Bool];
    init(_ vertexes: [Int]) {
        visited = Dictionary(uniqueKeysWithValues: zip(vertexes, Array(repeating: false, count: x.count)));
    }
    func getVisited(of vertex: Int) -> Bool? {
        guard let b = visited[vertex] else { return nil }
        return b;
    }
    func setVisited(of vertex: Int, newValue: Bool) {
        if(visited[vertex] != nil) {
            visited[vertex]? = newValue;
        }
    }
    func allVisited() -> Bool {
        for vertex in visited.keys {
            if !(visited[vertex]!) {  //es mexavor chem, ?-ov pordzel em chi exel, u if-i kariq chka
                return false;
            }
        }
        return true;
    }
}
func findMin(_ current: [Int],_ res: Result) -> Int? {
    var min = current[0];
    for k in current {
        guard let dist_of_k = res.getDist(of: k), let dist_of_min = res.getDist(of: min) else { return nil}
        if(dist_of_k != -1 && dist_of_k < dist_of_min) {
            min = k;
        }
    }
    return min;
}
func makeCurrent(_ keys: [Int],_ visited: Visited) -> [Int]? {
    var current = [Int]();
    for k in keys {
        guard let visited_k = visited.getVisited(of: k) else { return nil }
        if(!visited_k) {
            current.append(k);
        }
    }
    return current;
}

/**************** Dijkstra *****************/

func Dijkstra(_ x: Given) {
    var current = x.vertexes;
    var visited = Visited(x.vertexes);
    var res = Result(x.vertexes);
    while(!visited.allVisited()) {
        guard let vertex = findMin(current, res) else { return }
        guard let directions = x.directions(of: vertex) else { return }
        for k in directions { 
            guard 
            let dist_k = res.getDist(of: k),
            let dist_vertex = res.getDist(of: vertex),
            let x_dist_v_k = x.getDist(from: vertex, to: k)
            else { return }
            if(dist_k == -1) {
                res.setDist(of: k, newValue: dist_vertex + x_dist_v_k);
                res.setFrom(of: k, newValue: vertex);
            } else {
                let dist = dist_vertex + x_dist_v_k;
                if(dist < dist_k) {
                    res.setDist(of: k, newValue: dist);
                    res.setFrom(of: k, newValue: vertex);
                }
            }
        }
        if let curr = makeCurrent(x.vertexes, visited) {
            current = curr;
        }
        else { return }
        visited.setVisited(of: vertex, newValue: true);
    }
    res.show();
}
//************************//
var x = [
    1: [2: 6, 4: 1], 
    2: [1: 6, 4: 2, 5: 2, 3: 5], 
    3: [2: 5, 5: 5], 
    4: [1: 1, 2: 2, 5: 1],
    5: [2: 2, 3: 5, 4: 1]
];
var g = Given(x);
var res = Result(g.vertexes);
Dijkstra(g);



