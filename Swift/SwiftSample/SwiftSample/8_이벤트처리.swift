
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



#if false
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
#endif

// Delegate

// struct / class
protocol UITableViewDelegate: AnyObject {
  func tableView(_ tableView: UITableView, willSelectRowAt at: Int)
  func tableView(_ tableView: UITableView, didSelectRowAt at: Int)
  
  func tableView(_ tableView: UITableView, willDeselectRowAt at: Int)
  func tableView(_ tableView: UITableView, didDeselectRowAt at: Int)
}

//@objc protocol UITableViewDelegate {
//  @objc func tableView(_ tableView: UITableView, willSelectRowAt at: Int)
//  @objc func tableView(_ tableView: UITableView, didSelectRowAt at: Int)
//
//  @objc func tableView(_ tableView: UITableView, willDeselectRowAt at: Int)
//  @objc func tableView(_ tableView: UITableView, didDeselectRowAt at: Int)
//}

class UITableView: NSObject {
  // @property(weak, nonatomic) id<UITableViewDelegate> delegate;
  weak var delegate: UITableViewDelegate?
  // delegate에 사용되는 클래스는 Reference Type 이어야 한다.
  
  func select(at: Int) {
    delegate?.tableView(self, willSelectRowAt: at)
    print("UITableView select - \(at)")
    delegate?.tableView(self, didSelectRowAt: at)
  }
  
  func deselect(at: Int) {
    delegate?.tableView(self, willDeselectRowAt: at)
    print("UITableView deselect - \(at)")
    delegate?.tableView(self, didDeselectRowAt: at)
  }
}

class ViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, willSelectRowAt at: Int) {
    print("willSelectRowAt - \(at)")
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt at: Int) {
    print("didSelectRowAt - \(at)")
  }
  
  func tableView(_ tableView: UITableView, willDeselectRowAt at: Int) {
    print("willDeselectRowAt - \(at)")
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt at: Int) {
    print("didDeselectRowAt - \(at)")
  }
}

let tableView = UITableView()
let viewController = ViewController()

tableView.delegate = viewController

tableView.select(at: 10)
tableView.deselect(at: 10)


// Swift
// - ObjC는 거의 고려하지 않습니다.
// - App을 만들때 사용하는 라이브러리의 대부분을 Swift 전용 라이브러리를 사용합니다.

// Kotlin
// - Java와의 상호 운용성이 뛰어납니다.
// - Kotlin으로 앱을 개발할 때 자바의 라이브러리를 아직도 이용하고 있습니다.
//   : OKHttp / Retrofit / Gson / Glide

















