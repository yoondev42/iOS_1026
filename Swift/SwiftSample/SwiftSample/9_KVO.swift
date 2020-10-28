

import Foundation

// KVC: 스위프트에서 기본적으로 제공하는 기능이 아닙니다.
//   "JSON 직렬화 / 역직렬화" - Encode / Decode

// KVO: 프로퍼티의 값이 변경되었을 경우, 통보 받는다.
//  => 좀 더 쉽게 사용할 수 있도록 변경되었습니다.

class User {
  var name: String {
    willSet {
      print("willSet - \(newValue)")
    }

    didSet {
      print("didSet - \(oldValue) -> \(name)")
    }
  }

  init(name: String) {
    self.name = name
  }
}

let user = User(name: "Tom")
user.name = "Bob"
user.name = "Alice"
