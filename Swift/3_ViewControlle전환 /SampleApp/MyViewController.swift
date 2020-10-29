
import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


  @IBAction func onTouch(_ sender: Any) {
    
    // 현재의 ViewContrller를 제거한다.
    dismiss(animated: true, completion: nil)
  }

}
