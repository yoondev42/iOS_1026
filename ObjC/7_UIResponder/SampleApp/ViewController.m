
#import "ViewController.h"

// UIResponder - Responder Chain
//    Touch 이벤트는 Responder Chain 따라 전달되도록 설계되어 있습니다.
//   : View -> UIView -> ViewController -> UIViewController -> AppDelegate -> UIWindow

@implementation ViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesBegan\n");
  
  NSSet* t = event.allTouches;
  NSLog(@"%lu개의 터치가 발생하였습니다.", t.count);
  
  [super touchesBegan:touches withEvent:event];
  
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesEnded\n");
  
  [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  // printf("touchesMoved\n");
}

// 디바이스에서 테스트할 수 있습니다.
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesCancelled\n");
}


@end
