
import Foundation

// 1. 확장자: .swift
// 2. main 함수가 없습니다.
//    main.swift가 그 역활을 대신합니다.
// 3. Foundation - #import <Foundation/Foundation.h>

// 4. Swift 언어 특징
//  1) 안정성(Safe)
//     - 강 타입 언어입니다: 암묵적인 캐스팅이 거의 허용되지 않는다.
//     - ObjC 암묵적으로 허용되었던 많은 부분들이 컴파일 오류가 발생합니다.
//     - null을 안전하게 다룰 수 있는 방법을 제공합니다.
//       : Optional

//  2) 성능(Fast)
//     - Native 프로그래밍 언어
//       C/C++

//  3) 표현성(Expressive)
//     - ObjC에서 작성하던 수많은 보일러플레이트가 제거되었다.
//       간결하고 명확한 표현식

// ObjC: 참조 타입(reference type) / 기본 타입(built-in type)

// Swift: 모든 것이 '객체'이다.
//
//        객체
//          1) 참조 타입: ARC에 의한 수명 관리 - class
//          2) 값 타입: 기본 타입처럼 수명 관리 - struct, enum
//
//        모든 타입에 대해서 상태와 메소드를 가지고 있다.
//        Int, Double, String ...

// 변수를 만드는 방법
//  : 타입 추론을 통해 변수를 생성할 수 있습니다.
//  1) var: 가변값
//  2) let: 불변값

#if false
// 암시적 타입 추론: 우항의 타입을 통해 n의 타입을 컴파일 타임에 추론합니다.
var n = 10

// 명시적 타입 지정: 타입을 명시적으로 지정합니다.
var n2: Int64 = 42

// n += 10
print(n)
#endif

// Optional
// 1. Swift의 일반 타입은 기본적으로 nil을 가질 수 없습니다.
// var n: String = nil  // compile error!

// 2. nil을 변수에 대입하기 위해선, Optional 타입을 이용해야 합니다.
//   Optional 타입: nil 가능성이 있는 변수 타입

var n: Int? = 42
// 위의 n 변수의 값을 읽기 위해서는 반드시 n이 nil이 아닌지 검증해야 합니다.

if n != nil {
  // print(n)       // Optional(42)
  print(n!) // 42
}

// Optional Binding
if let n = n {
  print(n) // 42
}

var n2: Int = 10
print(n2)

// 반드시 NSObject의 자식일 필요가 없습니다.
class User {
  var name: String
  var age: Int

  static let N = 100

  // 초기화 메소드
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }

  static func display() {}

  func go(address: String) {}
  func go(address: String, speed: Int) {}

  // user.add(a: 10, b: 20)
  func add(a: Int, b: Int) -> Int {
    return a + b
  }

  // user.add(left: 10, right: 20)
  func add(left a: Int, right b: Int) -> Int {
    return a + b
  }

  // user.add(10, 20)
  func add(_ a: Int, _ b: Int) -> Int {
    return a + b
  }
}

// 전역 함수를 만들 수 있습니다.
func sub(_ a: Int, _ b: Int) -> Int {
  return a - b
}

// User* user = [[User alloc] initWithName:@"Tom" age:42];

var user = User(name: "Tom", age: 42)
user.go(address: "Suwon")
user.go(address: "Seoul", speed: 100)

// var result = user.add(a: 10, b: 20)
// var result = user.add(left: 10, right: 20)
var result = user.add(10, 20)
result = sub(20, 10)

User.display()
print(User.N)

// Ubuntu: apt / apt-get - Package manager
// macOS: brew.sh
