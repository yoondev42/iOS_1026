
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func onTouchXIB(_ sender: Any) {
    let controller = MyViewController()
    controller.modalPresentationStyle = .fullScreen
    present(controller, animated: true)
  }
  
}

