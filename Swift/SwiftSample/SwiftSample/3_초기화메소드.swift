
import Foundation

// 초기화 메소드
//  : 객체 생성시에 호출되는 함수
//  1. Optional 타입이 아닌 프로퍼티는 반드시 초기화 메소드를 통해 초기화해주어야 한다.
#if false
class Car {
  var speed: Int
  var color: Int

  // - (id)initWithSpeed:(int)speed color:(int)color;     - ARC[release]
  // + (Car*)carWithSpeed:(int)speed color:(int)color;    - ARC[autorelease]

  // 편의 생성자 - 생성자 위임
  //  => 지정 초기화를 메소드를 통해 객체를 생성하는 초기화 메소드
  convenience init(speed: Int) {
    self.init(speed: speed, color: 0)
  }

  convenience init(color: Int) {
    self.init(speed: 0, color: color)
  }

//  init(speed: Int) {
//    self.speed = speed
//    self.color = 0
//  }
//
//  init(color: Int) {
//    self.color = color
//    self.speed = 0
//  }

  // 아래는 편의 생성자가 아닙니다.
  static func blue(speed: Int) -> Car {
    return Car(speed: speed, color: 255)
  }

  // 지정 초기화 메소드
  init(speed: Int, color: Int) {
    self.speed = speed
    self.color = color
  }
}

var car = Car(speed: 10, color: 20)
car = Car(color: 42)
car = Car(speed: 100)
#endif

#if false
class Car {
  var speed: Int
  var color: Int

  convenience init(speed: Int) {
    self.init(speed: speed, color: 0)
  }

  // 지정 초기화 메소드
  init(speed: Int, color: Int) {
    self.speed = speed
    self.color = color
  }
}

// 1. 자식 클래스가 초기화 메소드를 정의하지 않았다면, 부모의 초기화 메소드를 물려 받는다.
//                                              - 지정 초기화 메소드 / 편의 생성자

// 2. 자식 클래스가 초기화 메소드를 한개라도 구현하였다면, 부모의 추기화 메소드를 더 이상 물려 받지 않는다.

// 3. 자식 클래스는 자식 클래스의 초기화 메소드에서 부모의 초기화 메소드를 명시적으로 호출해야 한다.
//    1) 자신의 필드를 먼저 초기화한다.
//    2) 부모의 지정 초기화 메소드를 통해 부모의 필드를 초기화한다.

class Truck: Car {
  var name: String

  init(speed: Int, color: Int, name: String) {
    self.name = name
    super.init(speed: speed, color: color)
  }
}

var truck = Truck(speed: 100, color: 20, name: "포터")
#endif

// User를 상속하는 모든 클래스는 반드시 init(name: String)을 제공해야 한다.
class User {
  var name: String

  required init(name: String) {
    self.name = name
  }
}

class Student: User {
  var number: Int

  init(name: String, number: Int) {
    self.number = number
    super.init(name: name)
  }

  // 부모 클래스가 요구하는 초기화 메소드를 반드시 제공해야 한다.
  required init(name: String) {
    self.number = 0
    super.init(name: name)
  }
}

// let student: Student? = Student()

// 실패 가능한 초기화 메소드 - 객체 생성에 실패하였을 경우 nil을 반환한다(ObjC)
class Computer {
  var price: Int

  // 실패하였을 경우, nil을 반환하는 초기화 메소드
  init?(price: Int) {
    // price가 음수라면, 객체 생성에 실패해야 한다.
    //  - 다른 언어: 예외를 발생해야 한다.
    //  - Swift: 실패 가능한 초기화 메소드
    if price < 0 {
      return nil
    }

    self.price = price
  }
}

// 실패 가능한 초기화 메소드를 통해 객체를 사용할 경우, 반드시 Optional로 받아야 한다.
var computer: Computer? = Computer(price: -10)
