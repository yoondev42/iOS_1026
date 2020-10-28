
import Foundation

// 초기화 메소드
//  : 객체 생성시에 호출되는 함수
//  1. Optional 타입이 아닌 프로퍼티는 반드시 초기화 메소드를 통해 초기화해주어야 한다.

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


