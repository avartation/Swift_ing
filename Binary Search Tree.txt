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
    static func >(lhs: Node, rhs: Node) -> Bool {
        return lhs.name > rhs.name;
    }
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.name == rhs.name;
    }
}

class BinarySearchTree {
    var nodes: Set<Node>
    var peak: Node?
    var count: Int
    
    init() {
        nodes = [];
        peak = nil;
        count = 0;
    }
    
    init(_ array: [String]) {
        func buildBST(_ array: [String],_ start: Int,_ finish: Int,_ parent: inout Node?) {
            if(start == finish) {
                let node = Node(array[start]);
                if((nodes.insert(node)).0) {
                    parent = node;
                }
                return;
            }
            let middle = (start + finish) / 2;
            parent = Node(array[middle]);
            if let parentNode = parent {
                nodes.insert(parentNode);
                buildBST(array, start, middle, &parentNode.leftChild);
                buildBST(array, middle + 1, finish, &parentNode.rightChild);
            }
            else { 
                print("smthing went Wrong!")
            }
        }
        nodes = [];
        peak = nil;
        count = array.count;
        buildBST(array.sorted(), 0, array.count-1, &peak);
    }
    
    func insert(_ name: String) {
        let node = Node(name);
        var rightPlace = peak;
        var parent: Node? = nil;
        var which: Bool = true;
        
        while let rPlace = rightPlace {
            parent = rPlace;
            if(node > rPlace) {
                rightPlace = rPlace.rightChild;
                which = true;
            }
            else {
                rightPlace = rPlace.leftChild;
                which = false;
            }
        }
        
        if var parentNode = parent {
            if(which) {
                parentNode.rightChild = node;
            }
            else {
                parentNode.leftChild = node;
            }
        }
        else { print("smthing wnet wrong!!!") }
    }
    
    func getNode(of: String) -> Node? {
        var result = peak;
        while let res = result {
            if(of == res.name) {
                return res; 
            }
            else if(of > res.name) {
                result = res.rightChild;
            }
            else {
                result = res.leftChild;
            }
        }
        return result;
    }
    
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

let array = ["G","B","A","H","F","N","C","D","M","E","L","K","J","I"]

var tree = BinarySearchTree(array);

tree.describe();

tree.insert("Q");
tree.insert("1");

tree.describe();

if let node = tree.getNode(of: "A") {
    print(node.name);
}


