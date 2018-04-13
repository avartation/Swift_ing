class Node {
    var name: String
    var parent: Node?
    var children: Set<Node>
    init(_ _name: String) {
        name = _name;
        parent = nil;
        children = [];
    }
}
extension Node: Hashable {
    var hashValue: Int {
        return name.hashValue;
    }
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.name == rhs.name;
    }
}

class Tree {
    var nodes: Set<Node>
    var peak: Node?
    var count: Int
    init() {
        nodes = [];
        peak = nil;
        count = 0;
    }
    func addNode(_ node: Node) {
        if(nodes.insert(node).0) {
            count += 1;
        }
    }
    func addChild(to: Node, child: Node) {
        if(to.parent == nil) {
            peak = to;
        }
        if(to.children.insert(child).0) {
            child.parent = to;
        }
    }
    
    // Amen toxum ktpi hamapatasxan sherty, 
    // "|"-erov arandznacrac, te um "erexeqn" en :D 
    func describe() {
        guard let _peak = peak else { 
            print("Can't find the peak !");
            return 
        }
        var level = [_peak];
        print(_peak.name);
        while(!level.isEmpty) {
            var newLevel = [Node]();
            for node in level {
                print(node.children.map{ $0.name }, terminator: " | ");
                newLevel += node.children;
            }
            print("");
            level = newLevel;
        }
    }
}

let nodeA = Node("A");
let nodeB = Node("B");
let nodeC = Node("C");
let nodeD = Node("D");
let nodeE = Node("E");
let nodeF = Node("F");
let nodeG = Node("G");
let nodeH = Node("H");
let nodeI = Node("I");
let nodeJ = Node("J");
let nodeK = Node("K");
let nodeL = Node("L");
let nodeM = Node("M");
let nodeN = Node("N");

var tree = Tree();
tree.addNode(nodeA);
tree.addNode(nodeB);
tree.addNode(nodeC);
tree.addNode(nodeD);
tree.addNode(nodeE);
tree.addNode(nodeF);
tree.addNode(nodeG);
tree.addNode(nodeH);
tree.addNode(nodeI);
tree.addNode(nodeJ);
tree.addNode(nodeK);
tree.addNode(nodeL);
tree.addNode(nodeM);
tree.addNode(nodeN);

tree.addChild(to: nodeA, child: nodeB); 
tree.addChild(to: nodeA, child: nodeC);
tree.addChild(to: nodeB, child: nodeD); 
tree.addChild(to: nodeB, child: nodeE);
tree.addChild(to: nodeB, child: nodeF);
tree.addChild(to: nodeB, child: nodeG);
tree.addChild(to: nodeC, child: nodeH);
tree.addChild(to: nodeC, child: nodeI);
tree.addChild(to: nodeD, child: nodeJ);
tree.addChild(to: nodeD, child: nodeK);
tree.addChild(to: nodeG, child: nodeL);
tree.addChild(to: nodeI, child: nodeM);
tree.addChild(to: nodeI, child: nodeN);


tree.describe();










