class Node {
    var name: String
    var parent: Node?
    var leftChild: Node?
    var rightChild: Node?
    init(_ _name: String) {
        name = _name;
        parent = nil;
        leftChild = nil;
        rightChild = nil;
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
    func addLeftChild(to: Node, leftChild: Node) {
        if(to.parent == nil) {
            peak = to;
        }
        to.leftChild = leftChild;
        leftChild.parent = to;
    }
    func addRightChild(to: Node, rightChild: Node) {
        if(to.parent == nil) {
            peak = to;
        }
        to.rightChild = rightChild;
        rightChild.parent = to;
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
                if let leftChild = node.leftChild, let rightChild = node.rightChild {
                    print("\(leftChild.name) , \(rightChild.name)", terminator: " | ");
                    newLevel += [leftChild, rightChild];
                } 
                else if let leftChild = node.leftChild {
                    print("\(leftChild.name) , _", terminator: " | ");
                    newLevel.append(leftChild);
                } 
                else if let rightChild = node.rightChild {
                    print("_ , \(rightChild.name)", terminator: " | ");
                    newLevel.append(rightChild);
                } else {
                    print("_ , _", terminator: " | ");
                }
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

tree.addLeftChild(to: nodeA, leftChild: nodeB); 
tree.addLeftChild(to: nodeB, leftChild: nodeD);
tree.addLeftChild(to: nodeC, leftChild: nodeF); 
tree.addLeftChild(to: nodeD, leftChild: nodeH);
tree.addLeftChild(to: nodeE, leftChild: nodeJ);
tree.addLeftChild(to: nodeI, leftChild: nodeL);
tree.addRightChild(to: nodeA, rightChild: nodeC);
tree.addRightChild(to: nodeB, rightChild: nodeE);
tree.addRightChild(to: nodeC, rightChild: nodeG);
tree.addRightChild(to: nodeD, rightChild: nodeI);
tree.addRightChild(to: nodeG, rightChild: nodeK);
tree.addRightChild(to: nodeI, rightChild: nodeM);
tree.addRightChild(to: nodeK, rightChild: nodeN);


tree.describe();




