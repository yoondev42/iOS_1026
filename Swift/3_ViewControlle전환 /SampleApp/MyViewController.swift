
import UIKit


struct User {
  let name: String
  let age: Int
}


class MyViewController: UIViewController {
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!
  
  var user: User?
  
  // viewDidLoad가 호출된 후에 view에 접근이 가능하다.
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("viewDidLoad 완료")

    // Do any additional setup after loading the view.
    
    // nameLabel.text = user?.name
    // ageLabel.text = "\(user?.age)"
    
    if let user = user {
      nameLabel.text = user.name
      ageLabel.text = "\(user.age)"
    }
  
  }

  @IBAction func onTouch(_ sender: Any) {
    // 현재의 ViewContrller를 제거한다.
    dismiss(animated: true, completion: nil)
  }
}
