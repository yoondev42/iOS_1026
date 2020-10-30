
#import "ViewController.h"

// UIResponder - Responder Chain

@implementation ViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesBegan\n");
  
  NSSet* t = event.allTouches;
  NSLog(@"%lu개의 터치가 발생하였습니다.", t.count);
  
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesEnded\n");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  // printf("touchesMoved\n");
}

// 디바이스에서 테스트할 수 있습니다.
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("touchesCancelled\n");
}


@end
