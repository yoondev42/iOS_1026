
import UIKit

class FirstController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  @IBAction func onTouch(_ sender: Any) {
    // performSegue(withIdentifier: "ShowSecondSegue", sender: self)
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

  @IBAction func onTouch(_ sender: Any) {}

  static func create() -> ThirdController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "SecondController") as! ThirdController
  }
}
