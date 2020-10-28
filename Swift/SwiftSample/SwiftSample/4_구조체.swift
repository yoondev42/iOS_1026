
import Foundation

// Reference Type: class
// Value Type: struct, enum

// 1. 사용자가 초기화 메소드를 제공하지 않을 경우, 멤버 와이즈 초기화 메소드를 자동으로 제공합니다.
//   => 사용자가 초기화 메소드를 제공하면, 멤버 와이즈 초기화 메소드는 제공되지 않는다.

// 2. 사용자가 객체를 문자열로 표현하는 기능을 제공하지 않아도, 기본적으로 제공이 된다.


#if false
class User : CustomStringConvertible {
  let name: String
  let age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  var description: String {
    get {
      return "User(name=\(name), age=\(age))"
    }
  }
  
  func move() {
    print("User move")
  }
}
#endif

#if false
struct User {
  let name: String
  let age: Int
    
  func move() {
    print("User move")
  }
}

let user = User(name: "Tom", age: 42)
user.move()
print(user)
#endif

// 3. 구조체는 let으로 사용하면, 불변 객체가 된다.
//    클래스는 let으로 사용해도, 불변 객체가 아니다.
#if false
class UserClass {
  var age: Int = 0
}

struct UserStruct {
  var age: Int = 0
}

// final User p1 = UserClass()
let p1 = UserClass()  // Reference Type
p1.age = 42

let p2 = UserStruct() // Value Type
// p2.age = 42
#endif

// 4. 클래스는 참조 계수 기반으로 관리되지만
//    구조체는 참조 계수 기반으로 관리되지 않는다.

// 5. 클래스 vs 구조체
//   1) 참조 계수를 증감하는 동작은 멀티 스레드에서 안전하게 동작해야 한다.(원자적 연산)
//      깊은 복사를 하는 것이 성능이 더 좋을 수 있다.
//   2) 힙에 객체를 생성하는 연산과 힙의 객체를 반환하는 연산은 오버헤드가 있다.
//      스택은 객체를 생성하고 파괴되는 비용이 없다.

#if false
struct User {

}

func foo() {
  var user: User? = User()   // 1
  var user2: User? = user    // 2
  // class: 참조 복사(얕은 복사) - 참조 계수 관리
  // struct: 깊은 복사        - 참조 계수 관리 X
  
  user = nil                 // 1
  user2 = nil                // 0
}

foo()
#endif

// 6. 구조체의 메소드는 self를 불변으로 취급한다.
//   mutating: 메소드에서 프로퍼티의 값을 변경할 수 있다.
//   불변 객체(let)에서는 mutating 메소드를 호출하는 것이 불가능하다.
struct Point {
  var x: Int
  var y: Int
  
  mutating func move(dx: Int, dy: Int) {
    x += dx
    y += dy
  }
  
  func printPoint() {
    print(self)
  }
}

let point = Point(x: 10, y: 20)

// point.move(dx: 2, dy: 3)
point.printPoint()























