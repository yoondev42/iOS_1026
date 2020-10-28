
import Foundation

#if false
// 1. 전달된 파라미터 인자는 불변으로 취급된다. - let
// 2. inout 파라미터 - 참조(주소)로 전달됩니다
func xswap(_ a: inout Int, _ b: inout Int) {
  let temp = a
  a = b
  b = temp
}

var a = 10
var b = 20
xswap(&a, &b)

print(a, b)

// Obj-C
// 1. NSArray
// 2. NSDictionary
//  : id를 저장하는 컬렉션
//   1) 타입 안정성이 없다.                    => Swift Generic
//   2) 불변 / 가변 클래스가 별도로 제공되었다.     => struct(var - 가변 / let - 불변)


// Array<Int>    = [Int]
// Array<String> = [String]

// let x: Array<Int> = [ 1, 2, 3, 4, 5 ]
let x: [Int] = [ 1, 2, 3, 4, 5 ]
// x.append(10)
// x.append(20)
// x[0] = 30
print(x)

// Dictionary<String, String> = [String:String]
// Dictionary<String, Int>    = [String:Int]

var d: Dictionary<String, String> = [
  "name": "Tom",
  "address": "Suwon"
]
d["level"] = "10"
#endif

// ObjC  - Block Programming
// Swift

// 0...10 : 0 ~ 10
// 0..<10 : 0 ~ 9

#if false
func sort(_ x: inout [Int], compare: (Int, Int) -> Bool) {
  
  for i in 0..<x.count - 1 {
    for j in i+1..<x.count {
      
      // if x[i] < x[j] {
      if compare(x[i], x[j]) {
        x.swapAt(i, j)
      }
    
    }
  }
}

func compare1(_ a: Int, _ b: Int) -> Bool {
  return a > b
}

func compare2(_ a: Int, _ b: Int) -> Bool {
  return a < b
}

var x = [ 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 ]
sort(&x, compare: compare2)

print(x)
#endif


#if false
// 함수를 참조하는 방법
//  - Swift에서 함수의 타입은 함수의 인자와 반환값에 의해 결정된다.

// (Int, Int) -> Int
func add(_ a: Int, _ b: Int) -> Int {
  return a + b
}

// (Int, Int) -> Int
func sub(_ a: Int, _ b: Int) -> Int {
  return a - b
}

var fp: (Int, Int) -> Int = add
fp = sub

print(fp(10, 20))
#endif

//------------------
func sort(_ x: inout [Int], compare: (Int, Int) -> Bool) {
  
  for i in 0..<x.count - 1 {
    for j in i+1..<x.count {
      
      // if x[i] < x[j] {
      if compare(x[i], x[j]) {
        x.swapAt(i, j)
      }
    
    }
  }
}

func compare1(_ a: Int, _ b: Int) -> Bool {
  return a > b
}

func compare2(_ a: Int, _ b: Int) -> Bool {
  return a < b
}

var x = [ 1, 3, 5, 7, 9, 2, 4, 6, 8, 10 ]

// 1) 기존 함수를 참조하는 방법
sort(&x, compare: compare2)

//-----
// 아래의 기술을 스위프트에서는 '클로저'라는 이름으로 부릅니다.

// 2) 코드 블록(람다)를 전달하는 것도 가능합니다.
sort(&x, compare: { (a: Int, b: Int) -> Bool in
  return a < b
})

// 3) 람다의 타입을 추론 가능하므로, 타입 생략이 가능합니다.
sort(&x, compare: { a, b in
  return a < b
})

// 4) 람다의 블록이 코드 한 줄이라면, return 생략 가능합니다.
sort(&x, compare: { a, b in
  a < b
})

// 5) 인자의 이름을 생략하고, $0 $1 $2 등의 이름을 통해 인자를 참조할 수 있습니다.
sort(&x, compare: {
  $0 < $1
})

// 6) 함수의 마지막 인자가 함수인 경우, 람다의 코드 블록을 함수 호출의 괄호 밖으로 뺄 수 있습니다.
sort(&x) {
  $0 < $1
}


print(x)

