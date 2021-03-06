class Node {
    let name: String
    var contacts: [Contact]
    var visited: Bool
    init(_ _name: String) {
        name = _name;
        contacts = [];
        visited = false;
    }
}

func ==(_ node1: Node,_ node2: Node) -> Bool {
    return node1.name == node2.name;
}

class Contact {
    let node: Node
    let dist: Int?
    init(_ _node: Node) {
        node = _node;
        dist = nil;
    }
    init(_ _node: Node,_ _dist: Int) {
        node = _node;
        dist = _dist;
    }
}

class Graph {
    var nodes: [Node]
    init() {
        nodes = [];
    }
    func addNode(_ name: String) -> Node {
        let node = Node(name);
        nodes.append(node);
        return node;
    }
    func addContact(_ from: Node,_ to: Node) {
        let contact = Contact(to);
        from.contacts.append(contact);
    }
}

func breadthFirstSearch(_ current: [Node],_ key: Node) -> Bool {
    if(current.isEmpty) {
        return false;
    }
    var nextCallCurrent = [Node]();
    for node in current {
        if(node == key) {
            return true;
        }
        for contact in node.contacts {
            let contactNode = contact.node;
            if(!contactNode.visited) {
                nextCallCurrent.append(contactNode);
                contactNode.visited = true;
            }
        }
    }
    return breadthFirstSearch(nextCallCurrent, key);
}

func depthFirstSearch(_ current: Node,_ key: Node) -> Bool {
    if(current == key) {
        return true;
    }
    for contact in current.contacts {
        let contactNode = contact.node;
        if(!contactNode.visited) {
            contactNode.visited = true;
            if(depthFirstSearch(contactNode, key)) {
                return true; 
            }
        }
    }
    return false;
}

func Dijkstra()


let graph = Graph()

let nodeA = graph.addNode("a");
let nodeB = graph.addNode("b");
let nodeC = graph.addNode("c");
let nodeD = graph.addNode("d");
let nodeE = graph.addNode("e");
let nodeF = graph.addNode("f");
let nodeG = graph.addNode("g");
let nodeH = graph.addNode("h");

graph.addContact(nodeA, nodeB);
graph.addContact(nodeA, nodeC);
graph.addContact(nodeB, nodeD);
graph.addContact(nodeB, nodeE);
graph.addContact(nodeC, nodeF);
graph.addContact(nodeC, nodeG);
graph.addContact(nodeE, nodeH);
graph.addContact(nodeE, nodeF);
graph.addContact(nodeF, nodeG);

/*
 Qani vor Graph-y, Node-y classer en,
irar hetevic functionnery chen ashxati, 
sax el visited-neri het gorc unen.
*/

let oddNode = Node("odd");

let x = "BFS";

switch x {
case "BFS":
    let containsNode = breadthFirstSearch([nodeA], nodeB);
    if(containsNodeB) {
        print("BFS: graph contains given node !");
    }
    else {
        print("BFS: graph doesn't contain given node !");
    }
case "DFS":
    let containsNode = depthFirstSearch(nodeA, oddNode);
    if(containsNodeD) {
        print("DFS: graph contains given node !");
    }
    else {
        print("DFS: graph doesn't contain given node !");
    }
default:
    break;
}
