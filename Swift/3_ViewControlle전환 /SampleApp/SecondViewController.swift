

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
}
