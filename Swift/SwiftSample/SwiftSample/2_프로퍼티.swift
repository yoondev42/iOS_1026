
import Foundation

// ObjC
//   - 필드에 접근지정자를 제공하는 것은 가능하지만, 프로퍼티에 접근지정자를 제공할 수 없다.
//   - 메소드에 접근지정자가 제공되지 않는다.

// 프로퍼티
//   @property(strong, nonatomic, readwrite) NSString* name;
//   소유권 지정
//      - strong
//      - weak               -  weak
//      - unsafe_unretained  -  unowned
//      - copy               -  X
//   동기화 지정
//      - atomic             -  X
//      - nonatomic          -  X
//   접근자 메소드
//      - readonly
//           let name -> getter
//      - readwrite
//           var name -> getter / setter

// '프로퍼티': 접근자 메소드를 자동으로 생성하는 문법

#if false
class User {
  // 프로퍼티 입니다.
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

let user = User(name: "Tom", age: 42)

user.name = "Bob"  // setter
user.age = 16      // setter

print(user.name)  // getter
print(user.age)   // getter
#endif

class Person {
  // Type property
  static var count: Int = 0
  
  // => Stored Property
  var _firstName: String
  
  var firstName: String {
    get {
      return _firstName
    }
    set {
      _firstName = newValue
    }
  }
  
  var lastName: String
  
  // Backing Field가 없는 프로퍼티
  //  => Computed Property
  var fullName: String {
    get {
      // 문자열을 조합하는 문법 - String Interpolation(보간)
      return "\(firstName) \(lastName)"
    }
    
    // set(value) {
    set {
      let arr = newValue.split(separator: " ")
      firstName = "\(arr[0])"
      lastName = "\(arr[1])"
    }
  }
  
  init(firstName: String, lastName: String) {
    self._firstName = firstName
    self.lastName = lastName
  }
}

let person = Person(firstName: "Gildong", lastName: "Hong")
print(person.fullName)

person.fullName = "Soonshin Lee"
print(person.fullName)

Person.count += 3;
print(Person.count)

