
import UIKit

// '원격의 이미지'를 로드하는 방법

class ViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  
  static let imageURL = URL(string: "https://media.playstation.com/is/image/SCEA/cyberpunk-2077-listing-thumb-01-ps4-06jun19-ko-kr?$native_nt$")!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // NSURL  -> URL
  // NSData -> Data
  
  // 문제점: 아래의 코드는 동기로 작성하는 코드입니다.
  //   => 이미지를 다운로드 받는 동작이 느릴 경우, UI가 멈출 수 있습니다.
  @IBAction func loadImage1(_ sender: UIButton) {
//    guard let url = URL(string: ViewController.imageURL) else {
//      print("잘못된 형식의 URL 입니다")
//      return
//    }
    
    // throws: 예외 가능성이 있는 연산
    //  try? - 예외가 발생해서 실패할 경우, nil을 반환한다.
    guard let data = try? Data(contentsOf: ViewController.imageURL) else {
      print("이미지 데이터 다운로드에 실패하였습니다.")
      return
    }
    
    guard let image = UIImage(data: data) else {
      print("이미지 변환에 실패하였습니다.")
      return
    }
    
    imageView.image = image
  }
  
  // '비동기'를 통해 이미지를 다운로드 받아야 합니다.
  //   => 완료 시점에 수행될 콜백 함수를 등록합니다.
  //     NSURLConnection -> deprecated!
  //     => NSURLSession
  //   => 콜백 함수의 인자를 통해 해당 동작의 성공/실패 여부를 전달합니다.
  //      : Swift에서는 콜백 함수의 마지막 인자를 에러의 전달 용도로 사용합니다.
  
  @IBAction func loadImage2(_ sender: UIButton) {
    let session = URLSession(configuration: .default)
    
    // 1) Task를 만든다.
    let task = session.downloadTask(with: ViewController.imageURL) { (location: URL?, response: URLResponse?, error: Error?) in
      // 1. 성공 실패 여부 확인
      //   : 서버에 도달하지도 못한 오류
      if let error = error {
        print("실패: \(error.localizedDescription)")
        return
      }
      
      guard let response = response as? HTTPURLResponse else {
        print("응답이 존재하지 않습니다.")
        return
      }
      
      // 2. Response 확인
      //  HTTP - status code
      //    200..<300: OK
      //    400..<500: Client Error
      //    500..<600: Server Error
      print("\(response.statusCode)")

//      guard (200..<300).contains(response.statusCode) else {
//        print("요청에 실패하였습니다. - \(response.statusCode)")
//        return
//      }
      
      guard 200 ..< 300 ~= response.statusCode else {
        print("요청에 실패하였습니다. - \(response.statusCode)")
        return
      }
      
      guard let location = location else {
        return
      }
      
      
      print("location: \(location)")
      guard let data = try? Data(contentsOf: location) else {
        return
      }
      
      guard let image = UIImage(data: data) else {
        return
      }
      
      // UI를 업데이트 하는 작업은 반드시 main 스레드에서 수행되어야 한다.
      DispatchQueue.main.async {
        self.imageView.image = image
      }
      
    }
    
    // 2) Task 비동기로 실행한다.
    task.resume()
  }
  
  @IBAction func loadImage3(_ sender: UIButton) {}
  
  @IBAction func loadImage4(_ sender: UIButton) {}
  
  @IBAction func loadImage5(_ sender: UIButton) {}
}
