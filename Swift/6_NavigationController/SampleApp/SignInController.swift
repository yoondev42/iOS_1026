
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
    center.addObserver(self,
                       selector: #selector(keyboardWillShow),
                       name: UIResponder.keyboardWillShowNotification,
                       object: nil)
    
    center.addObserver(self,
                       selector: #selector(keyboardWillHide),
                       name: UIResponder.keyboardWillHideNotification,
                       object: nil)
    
    // heightInitialValue = heightConstraint.constant
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
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    // 키보드를 내려주는 경우가 많습니다.
    view.endEditing(true)
  }

}
