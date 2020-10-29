

import UIKit

class SecondViewController: UIViewController {
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var ageLabel: UILabel!

  var user: User?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    if let user = user {
      nameLabel.text = user.name
      ageLabel.text = "\(user.age)"
    }
  }

  // 자기 자신을 스토리보드의 파일에서 찾아서 생성하는 정적 메소드를 약속합시다.
  //  1) Storyboard ID: 자신 타입의 이름을 사용하도록 약속할 필요가 있습니다.
  static func create() -> SecondViewController {
    // Main.storyboard
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondViewController
  }
}
