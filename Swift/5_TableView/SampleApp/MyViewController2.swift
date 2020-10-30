
import UIKit

class MyViewController2: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    tableView.dataSource = self
  }
}

extension MyViewController2 : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  // Storyboard 기반으로 사용할 경우,
  // Cell의 견본을 tableView에 미리 등록하는 것이 가능합니다.
  // - tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    cell.textLabel?.text = "Cell - \(indexPath)"
    return cell
  }
  
  
  #if false
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell")
    if (cell == nil) {
      cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
      print("Cell 생성 - \(indexPath)")
    } else {
      print("Cell 재활용 - \(indexPath)")
    }
    
    cell?.textLabel?.text = "Cell - \(indexPath)"
    return cell!
  }
  #endif
}
