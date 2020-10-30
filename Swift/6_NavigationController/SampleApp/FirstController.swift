
import UIKit


//   - UIViewController
//       => present / dismiss
//   - UINavigationController
//       => pushViewController / popViewController
//         - FirstController
//         - SecondController
//         - ThirdController


class FirstController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func onTouch(_ sender: Any) {
    // performSegue(withIdentifier: "ShowSecondSegue", sender: self)
    
    // 1. 이동하고자 하는 컨트롤러 생성(XIB 동일)
    let controller = SecondController.create()
    
    // present(controller, animated: true, completion: nil)
    
    // NavigationController안의 모든 뷰 컨트롤러는 아래의 속성을 통해 자신의 NavigationController에 접근 가능합니다.
    navigationController?.pushViewController(controller, animated: true)
    
    
  }

  static func create() -> FirstController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "FirstController") as! FirstController
  }
}



class SecondController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func onTouch(_ sender: Any) {
    // performSegue(withIdentifier: "ShowThirdSegue", sender: self)
    
    let controller = ThirdController.create()
    navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func unwind(segue: UIStoryboardSegue) {}

  static func create() -> SecondController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
  }
}

class ThirdController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func onTouch(_ sender: Any) {
    // navigationController?.popViewController(animated: true)  - 이전
    // navigationController?.popToRootViewController(animated: true) - 처음
    // navigationController?.popToViewController(controller, animated: true) - 특정 컨트롤러
    
    dismiss(animated: true, completion: nil)
  }

  static func create() -> ThirdController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "ThirdController") as! ThirdController
  }
}
