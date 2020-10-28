import Foundation

// '참조 계수 기반'의 수명 관리
//  => 참조 타입
//  => Swift class

#if false
class Image {
  init() {
    print("Image 객체 생성")
  }
  
  // 소멸 블록
  deinit {
      print("Image 객체 파괴")
  }
}

var image: Image? = Image()
print("let image = Image()")

image = nil
print("image = nil")
#endif

#if false
class Node {
  // Strong reference
  // var next: Node?
  
  // Weak reference: auto niling을 지원하고 있습니다.
  //  => weak은 Optional 타입에 대해서만 사용할 수 있습니다.
  weak var next: Node?
  
  // unowned var next: Node?
  
  deinit {
    print("Node 파괴")
  }
}

func foo() {
  let n1 = Node()
  let n2 = Node()
  
  n1.next = n2
  n2.next = n1
}

// foo()
var n1: Node? = Node()

let n2 = Node()
n2.next = n1

print(n2.next) // ?
n1 = nil
print(n2.next) // ?
#endif

// 생성 시간이 오래 걸린다.
//   => Lazy Initialization(지연 초기화)
//      - 처음 접근되는 시점에 생성하는 것이 좋다.
class Image {
  init() {
    print("Image 객체 생성")
  }
}

class Person {
  lazy var image: Image = Image()
  
  init() {
    print("Person 객체 생성")
  }
}

let person = Person()
print("Person 객체 생성 후")
print(person.image)








