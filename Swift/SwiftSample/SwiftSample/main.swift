
import Foundation

// Optional - 'enum'으로 구현되어 있습니다.


// 1. enum 기본 사용법
//   - enum은 값 타입입니다.

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



