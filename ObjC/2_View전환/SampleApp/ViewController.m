#import "ViewController.h"


// 화면 전환 하는 방법
//  - Android
//    => Activity 전환
//       Fragment 전환

//  - iOS
//    => 화면을 전환하는 다양한 방법

// UIWindow
//    - rootViewController: ViewController
//                              - UIView* view
//     1) Interface Builder

//     2) Storyboard

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

// view에 새로운 view 추가하는 함수
//  - addSubView
//  - removeFromSuperview

- (IBAction)onTouch:(id)sender {
  
  [UIView beginAnimations:nil context:nil];
  
  [UIView setAnimationDuration:1];
  [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp
                         forView:self.view
                           cache:YES];
  
  [self.view addSubview:_childView];
  
  
  [UIView commitAnimations];
}

- (IBAction)onTouch2:(id)sender {
  [_childView removeFromSuperview];
}





@end
