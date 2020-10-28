
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
  
  if let name = json["name"] as? String {
    if let age = json["age"] as? Int {
        print(name)
        print(age)
    }
  }
  
  
  
  
}

let userJSON: [String:Any] = [
  "name": "Tom",
  "age": 42
]
printJSON(userJSON)
