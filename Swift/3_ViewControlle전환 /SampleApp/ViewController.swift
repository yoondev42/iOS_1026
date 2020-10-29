
import UIKit

// ViewController 전환
// 1. XIB 기반 ViewController 전환
// 2. Storyboard 기반 ViewController 전환

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // 1. Cocoa Touch Class 추가
  //    - UIViewController의 자식 클래스로 추가
  //    - also create xib file [O]
  
  @IBAction func onTouchXIB(_ sender: Any) {
    let controller = MyViewController()
    controller.modalPresentationStyle = .fullScreen
    
    // - 아래처럼 사용하면 안됩니다.
    //   이유: viewDidLoad가 호출되기 전에는 View에 접근이 불가능하다.
    // controller.nameLabel.text = "Tom"
    // controller.ageLabel.text = "42"
    
    // 데이터를 전달한다.
    controller.user = User(name: "Tom", age: 42)
    
    present(controller, animated: true, completion: {
      print("present 완료")
      // controller.nameLabel.text = "Tom"
      // controller.ageLabel.text = "42"
    })
  }
  
  // 2. 전환 코드
  //  1) MyViewContrller 객체 생성
  //        presentViewController  /  present
  //        dismissViewController  /  dismiss
  //           : 자식 ViewController가 호출하였을 경우
  //              - 스스로 내려간다.
  //             부모 ViewController가 호출하였을 경우
  //              - 자신의 가장 상단에 있는 ViewContrller가 제거된다.
  
  // 2) 객체를 사용자가 직접 생성하지 않는다.
  //    performSegue에 의해서 프레임워크 내부에서 생성된다.
  //    특정한 데이터를 다음 컨트롤러에 전달하기 위해서는
  //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) 함수를 통해 처리해야 한다.
  
  @IBAction func onTouchStoryboard(_ sender: Any) {
    // MySegue를 전환을 발동해야 합니다.
    performSegue(withIdentifier: "MySegue", sender: self)
  }
  
  // Segue가 발동되기 전에 호출되는 함수
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("prepare")
    if (segue.identifier == "MySegue") {
      if let controller = segue.destination as? SecondViewController {
        controller.user = User(name: "Tom", age: 42)
      }
    }
  }
  
  @IBAction func unwind(segue: UIStoryboardSegue) {}
}
