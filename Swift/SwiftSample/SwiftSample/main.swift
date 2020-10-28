
import Foundation

// Int: struct

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
