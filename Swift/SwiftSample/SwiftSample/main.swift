
import Foundation

// JSON: Javascript Object Notation
#if false
// {
//    "name": "Tom",
//    "age": 42,
//    "height": 3.14
// }
#endif

// id / NSObject  =>    Any

// Dictionary<String, Any> - JSON Object
// [String:Any]

func printJSON(_ json: [String:Any]) {

  // let v1: Any? = json["name"]
  // let v2: String? = json["name"] as? String
  
//  if let name = json["name"] as? String {
//    if let age = json["age"] as? Int {
//        print(name)
//        print(age)
//    }
//  }
  
  // 아래의 중괄호를 없애기 위해서는 빠른 탈출 구문을 작성해야 한다.
  // 빠른 탈출 구문 문제점
  //  : 조건을 반대로 작성하는 부분에서 논리적인 오류가 발생할 수 있다.
  //  해결: guard-else
  
  guard let name = json["name"] as? String,
     let age = json["age"] as? Int else {
    
    return
  }
  
  print(name) // String
  print(age)  // Int

}

let userJSON: [String:Any] = [
  "name": "Tom",
  "age": 42
]
printJSON(userJSON)
