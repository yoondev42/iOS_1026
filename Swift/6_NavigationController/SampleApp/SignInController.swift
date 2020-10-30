
import UIKit

class SignInController: UIViewController {
  @IBOutlet var emailField: UITextField!
  @IBOutlet var passwordField: UITextField!
  
  var heightInitialValue: CGFloat = 0
  @IBOutlet var heightConstraint: NSLayoutConstraint! {
    // heightContraint가 처음 초기화되는 시점에 호출된다.
    didSet {
      heightInitialValue = heightConstraint.constant
    }
  }
  
  // SoftKeyboard가 뷰를 가릴 경우,
  // SoftKeyboard가 나올 때, 뷰의 위치를 변경하고
  // SoftKeyboard가 사라질 때 뷰의 위치를 원래대로 복원해야 합니다.
  //  => NotificationCenter
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    let center = NotificationCenter.default
    
    // Target-Action
    
    // queue - 비동기 처리의 루틴은 다른 스레드에서 수행됩니다.
    //         어떤 스레드에서 동작할지 지정하는 것이 가능합니다.
    //          : UI의 변경은 반드시 main 스레드에서 수행되어야 합니다.
    center.addObserver(forName: UIResponder.keyboardWillShowNotification,
                       object: nil,
                       queue: .main) { notification in
      
      let height = self.softKeyboardHeight(notification)
      
      UIView.animate(withDuration: 1.0) {
        self.heightConstraint.constant = self.heightInitialValue + height
        self.view.layoutIfNeeded()
      }
    }
    
    #if false
    center.addObserver(self,
                       selector: #selector(keyboardWillShow),
                       name: UIResponder.keyboardWillShowNotification,
                       object: nil)
    #endif
    
    center.addObserver(self,
                       selector: #selector(keyboardWillHide),
                       name: UIResponder.keyboardWillHideNotification,
                       object: nil)
    
    // heightInitialValue = heightConstraint.constant
    
    // 배터리 상태를 모니터링 하는 기능도 가능합니다.
    //  1) 실제 디바이스에서 테스트가 가능합니다.
    //  2) UIDevice에서 모니터링에 대한 부분을 활성화해주어야 합니다.
    UIDevice.current.isBatteryMonitoringEnabled = true
    
    center.addObserver(forName: UIDevice.batteryStateDidChangeNotification, object: nil, queue: .main) { notification in
      print("batteryStateDidChangeNotification - \(notification)")
    }
    
    center.addObserver(forName: UIDevice.batteryLevelDidChangeNotification, object: nil, queue: .main) { notification in
      print("batteryLevelDidChangeNotification - \(notification)")
    }
    
    // 사용자 정의 이벤트를 등록하는 것도 가능합니다.
    center.addObserver(forName: Notification.Name("MyEvent"),
                       object: nil,
                       queue: .main) { _ in
      print("MyEvent1")
    }
    center.addObserver(forName: Notification.Name("MyEvent"),
                       object: nil,
                       queue: .main) { _ in
      print("MyEvent2")
    }
  }
  
  // 1. self.view의 위치를 변경해서, 처리하는 방법
  // 2. constraint의 상수값을 동적으로 변경하는 방법
  
  @objc func keyboardWillShow(_ notification: Notification) {
    print("keyboardWillShow")
    // print(softKeyboardHeight(notification))
    
    let height = softKeyboardHeight(notification)
    // self.view.frame.origin.y = 0 - height
    
    // Closure 안에서는 self.을 명시적으로 사용해야 한다.
    UIView.animate(withDuration: 1.0) {
      self.heightConstraint.constant = self.heightInitialValue + height
      self.view.layoutIfNeeded()
    }
  }
  
  @objc func keyboardWillHide(_ notification: Notification) {
    print("keyboardWillHide")
    // self.view.frame.origin.y = 0
    UIView.animate(withDuration: 1.0) {
      self.heightConstraint.constant = self.heightInitialValue
      self.view.layoutIfNeeded()
    }
  }
  
  // 키보드의 크기를 구하는 함수
  func softKeyboardHeight(_ notification: Notification) -> CGFloat {
    guard let userInfo = notification.userInfo else {
      return 0
    }
    
    guard let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
      return 0
    }
    
    return frame.cgRectValue.height
  }
  
  @IBAction func signIn(_ sender: UIButton) {
    // Notification Center의 이벤트를 발생시키는 방법
    let center = NotificationCenter.default
    
    center.post(name: NSNotification.Name(rawValue: "MyEvent"), object: nil)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    // 키보드를 내려주는 경우가 많습니다.
    view.endEditing(true)
  }
}
