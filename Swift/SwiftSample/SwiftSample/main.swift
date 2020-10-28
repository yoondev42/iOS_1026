
import Foundation

// Event Handling
// 1. Target-Action
// 2. Delegate
// 3. Block Programming(ObjC) -> Swift Closure

// id  _target
// SEL _action
// [button addTarget:dialog action:@selector(close)];


// ObjC
//   NSObject를 기반으로하는 클래스

// Swift
//   NSObject를 기반으로 하지 않습니다.
//   - Any
//     모든 Swift의 객채
//   - AnyObject(=id)




class UIButton {
  private var target: AnyObject?
  private var action: Selector?
  
  func addTarget(_ target: AnyObject, action: Selector) {
    self.target = target
    self.action = action
  }
  
  func click() {
    
    // [_target performSelector:_action];
    _ = target?.perform(action)
  }
}

class Dialog {
  // 아래의 메소드를 Selector를 이용해서 호출하기 위해서는 반드시 objC의 메소드로 노출해야 한다.
  @objc func close() {
    print("Dialog close")
  }
}

let button = UIButton()
let dialog = Dialog()

// [button addTarget:dialog action:@selector(close)];
button.addTarget(dialog, action: #selector(Dialog.close))

button.click()

