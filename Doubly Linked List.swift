class ListNode<T> {
    var val: T
    var prev: ListNode<T>?
    var next: ListNode<T>?
    init(_ value: T) {
        val = value;
        prev = nil;
        next = nil;
    }
}

class List<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
    var count: Int
    
    
    init() {
        head = nil;
        tail = nil;
        count = 0;
    }
    
    var isEmpty: Bool {
        return count == 0;
    }
    
    func getNode(index: Int) -> ListNode<T>? {
        var i = index;
        if(i > count-1 || i < 0) {
            print("Index out of range !!!");
            return nil;
        }
        let b = (i < count/2);
        var hold = b ? head : tail;
        while (i > 0) && (i < count - 1) {
            guard let _hold = hold else { return nil }
            hold = b ? _hold.next : _hold.prev;
            i += b ? -1 : 1;
        }
        return hold;
    }
    
    func insert(val: T, index: Int) {
        if(isEmpty) {
            head = ListNode<T>(val);
            tail = head;
            count = 1;
            return
        }
        var i = index;
        var node = ListNode<T>(val);
        if(i >= count) {
            guard var _tail = tail else { return }
            _tail.next = node;
            node.prev = _tail;
            tail = node;
        }
        else if(i <= 0) {
            guard var _head = head else { return }
            node.next = _head;
            _head.prev = node;
            head = node;
        }
        else {
            guard let _hold = getNode(index: i) else { return }
            guard let _prev = _hold.prev else { return }
            _prev.next = node;
            node.prev = _prev;
            node.next = _hold;
            _hold.prev = node;
        }
        count += 1;
    }
    
    func remove(index: Int) -> ListNode<T>? {
        var i = index;
        if(isEmpty) {
            return nil;
        }
        else if(count == 1 && i == 0) {
            var _head = head;
            head = nil;
            tail = nil;
            
            count = 0;
            return _head;
        }
        else if(i == 0) {
            guard let _head = head else { return nil }
            guard let _next = _head.next else { return nil }
            head = _next;
            _next.prev = nil;
            
            count -= 1;
            return _head;
        }
        else if(i == count - 1) {
            guard let _tail = tail else { return nil }
            guard let _prev = _tail.prev else { return nil }
            tail = _prev;
            _prev.next = nil;
            
            count -= 1;
            return _tail;
        }
        else {
            guard let node = getNode(index: index) else { return nil }
            guard let _prev = node.prev, let _next = node.next else { return nil }
            _prev.next = _next;
            _next.prev = _prev;
            
            count -= 1;
            return node;
        }
    }
    
    func describe() {
        print("");
        if head == nil {
            print("List is empty!");
            return
        }
        var hold = head;
        while var _hold = hold {
            print(_hold.val, terminator: " ");
            hold = _hold.next;
        }
        print("\n");
    }
}

var list = List<String>();

list.describe();

list.insert(val: "Hi, there,", index: -2);        // ete at-y 0-ic poqr a demic a kcum
list.insert(val: "and we will be", index: 7);     // ete at-y count-ic mec a, verjic
list.insert(val: "my name is List,", index: 1);
list.insert(val: "I believe", index: 3);
list.insert(val: "good friends", index: 3);

list.describe();

if let node = list.getNode(index: 3) {
    print("Index 3 node value: \(node.val)");
}
if let removedNode = list.remove(index: 1) {
    print("Removed node value: \(removedNode.val)");
}

list.describe();


