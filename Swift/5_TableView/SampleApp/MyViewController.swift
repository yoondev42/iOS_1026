import UIKit

class MyViewController: UIViewController {
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    tableView.dataSource = self
    
    // 견본을 등록한다.
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
    
  }
}

// extension을 이용하면, 기존 클래스에 새로운 메소드를 추가하는 것이 가능합니다.
// 새로운 프로토콜을 추가적으로 구현하는 것도 가능합니다.

extension MyViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
    cell.textLabel?.text = "Cell - \(indexPath)"
    return cell
  }
  
  #if false
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MyCell")
    if (cell == nil) {
      // cell = UITableViewCell() // !
      cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
      print("Cell 생성 - \(indexPath)")
    } else {
      print("Cell 재활용 - \(indexPath)")
    }
    
    cell?.textLabel?.text = "Cell - \(indexPath)"
    return cell!
  }
  #endif
  
  
  
  
  
  // Cell을 데이터의 개수 만큼 생성하는 것이 아니라,
  // 화면에 필요한만큼만 생성하고, 나머지의 데이터는 기존의 Cell을 재활용해야 한다.
  // => View Holder Pattern
  #if false
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "Cell"
    return cell
  }
  #endif
}
