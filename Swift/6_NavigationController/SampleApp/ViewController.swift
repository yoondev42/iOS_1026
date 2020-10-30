
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func onTouch(_ sender: Any) {
    // UINavigation Controller를 코드에서 사용하는 방법
    let naviController = UINavigationController(rootViewController:
                                                  FirstController.create())
    
    naviController.modalPresentationStyle = .fullScreen
    present(naviController, animated: true)
  }
}

