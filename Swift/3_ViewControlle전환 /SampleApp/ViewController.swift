
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
  
  
  @IBAction func onTouchStoryboard(_ sender: Any) {
    let controller = SecondViewController.create()
    controller.user = User(name: "Bob", age: 36)
    present(controller, animated: true)
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
  
  #if false
  var user: User?
  @IBAction func onTouchStoryboard(_ sender: Any) {
    // let user = User(name: "Tom", age: 42)
    user = User(name: "Tom", age: 42)
    
    
    // MySegue를 전환을 발동해야 합니다.
    performSegue(withIdentifier: "MySegue", sender: self)
  }
  
  // Segue가 발동되기 전에 호출되는 함수
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("prepare")
    if (segue.identifier == "MySegue") {
      if let controller = segue.destination as? SecondViewController {
        // controller.user = User(name: "Tom", age: 42)
        controller.user = user
      }
    }
  }
  #endif
  
  @IBAction func unwind(segue: UIStoryboardSegue) {}
}

// XIB
// 1. 화면 하나당 별도의 XIB 파일이 필요하다.
// 2. 컨트롤러 객체를 직접 생성하기 때문에, 데이터의 전달 등의 용이하다.

// Storyboard
//  1. 여러개의 ViewContrller을 하나의 파일을 통해 관리할 수 있다.
//  2. 컨트롤러 객체의 생성이 프레임워크를 통해 이루어지기 때문에, 데이터의 전달 등을 위해서는 prepare를 통해 처리해야 한다.
//  3. 하나의 스토리보드에 수많은 뷰 컨트롤러가 제공될 경우, 느리다.
//       => 파일을 분리할 수 있다.
//  4. Git - conflict를 해결하기 어렵다.

// Storyboard를 사용할 때, Segue를 이용하면, 데이터 교환이 불편하다.
//   => 편리하게 사용하는 방법이 있습니다.


//        <iOS 5>     <iOS 13>
// XIB -> Storyboard -> Swift UI
//                    Jetpack compose(Android)
