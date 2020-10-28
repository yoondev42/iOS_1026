
import Foundation

// Reference Type: class
// Value Type: struct, enum

// 1. 사용자가 초기화 메소드를 제공하지 않을 경우, 멤버 와이즈 초기화 메소드를 자동으로 제공합니다.
//   => 사용자가 초기화 메소드를 제공하면, 멤버 와이즈 초기화 메소드는 제공되지 않는다.

// 2. 사용자가 객체를 문자열로 표현하는 기능을 제공하지 않아도, 기본적으로 제공이 된다.


class User {
  let name: String
  let age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
//  func description() -> String {
//    return "User - name=\(name) age=\(age)"
//  }
  
  func move() {
    print("User move")
  }
}

let user = User(name: "Tom", age: 42)
user.move()
print(user)
