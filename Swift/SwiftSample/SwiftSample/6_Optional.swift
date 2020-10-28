
import Foundation

// Optional - 'enum'으로 구현되어 있습니다.

// 1. enum 기본 사용법
//   - enum은 값 타입입니다.
#if false
enum School {
  case primary
  case elementary
  case middle
  case high
}

enum Gender {
  case male, female
}

// 1. switch - case 구문에서 'break'는 기본 동작입니다.
//           - fallthrough: 다음 라벨로 이동시킬 수 있습니다.

func printSchool(school: School) {
  switch school {
  case .primary:
    print("primary")
    fallthrough
  case .elementary:
    print("elementary")
  case .middle:
    print("middle")
  case .high:
    print("high")
  }
}

let school = School.primary
printSchool(school: school)
#endif

#if false
// 2. enum은 원시값(rawValue)을 지원합니다.
//  - Int, String, Double등의 값을 가질 수 있습니다.
enum School: String {
  case primary = "Primary School"
  case elementary
  case middle
  case high
}

// let school = School.primary
// print(school.rawValue)

// 3. Swift enum의 가장 강력한 기능
//    연관값(Associated Value)

enum NetworkError {
  case invalidParameter(String)
  case timeout(Double)
  case internalServer(Int, String)
}

let error1 = NetworkError.invalidParameter("name이 존재하지 않습니다")
let error2 = NetworkError.timeout(3.0)
let error3: NetworkError = .internalServer(500, "서버에서 치명적인 오류가 발생하였습니다")

// 연관된 값을 얻는 방법
// 1. if-case 구문을 통해서 얻을 수 있다.
func printError(_ error: NetworkError) {
//  if case .invalidParameter(let message) = error {
//    print(message)
//  } else if case .timeout(let sec) = error {
//    print("시간초과 - \(sec)")
//  } else if case .internalServer(let status, let message) = error {
//    print("서버오류 - \(status):\(message)")
//  }

//    if case let .invalidParameter(message) = error {
//      print(message)
//    } else if case let .timeout(sec) = error {
//      print("시간초과 - \(sec)")
//    } else if case let .internalServer(status, message) = error {
//      print("서버오류 - \(status):\(message)")
//    }

  switch error {
  case let .invalidParameter(message):
    print(message)
  case let .timeout(sec):
    print("시간초과 - \(sec)")
  case let .internalServer(status, message):
    print("서버오류 - \(status):\(message)")
  }

  switch error {
  case let .invalidParameter(message):
    print(message)
  case let .timeout(sec):
    print("시간초과 - \(sec)")
  case let .internalServer(status, message):
    print("서버오류 - \(status):\(message)")
  }
}

printError(error1)
printError(error2)
printError(error3)
#endif

// Optional
// enum XOptional<T> {
//  case none
//  case some(T)
// }
//
// var p: XOptional<Int> = .some(42)
// var p: Optional<Int> = .some(42)
#if false
var p: Int? = 42 // .some(42)

switch p {
case .none:
  print("값이 존재하지 않습니다.")
case let .some(value):
  print("value=\(value)")
}

if let p = p {
  print(p)
} else {
  print("값이 존재하지 않습니다.")
}
#endif

class User {
  var name: String = "Tom"

  func hello() {
    print("User hello")
  }
}

// 1. User   - nil 가능성이 없는 타입
// 2. User?  - nil 가능성이 있기 떄문에
//    : Optional Binding / Optional Chaining 을 통해 안전하게 사용해야 한다.
//
// 3. User!: 암시적 추출 타입
// => nil 가능성이 있는 타입이지만, nil 체크를 하지 않아도 된다.
//    nil일 경우 예외로 인해 프로그램이 비정상 종료 한다.
//  : 사용하지 않는 것이 좋다.

var user: User!
user.hello()

#if false
var user: User? = User()
// Optional Binding
if let user = user {
  user.hello()
}

// Optional Chaining
user?.hello()

let name: String? = user?.name
if let name = user?.name {
  print(name)
}

#endif
