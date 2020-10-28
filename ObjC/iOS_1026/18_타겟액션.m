#import <Foundation/Foundation.h>

// Android - Button 이벤트
#if 0
Button button = (Button)findById(R.id.button);
button.setOnClickListener(new View.OnClickListener {
  @Override
  public void onClick(View view) {
    // Button이 클릭되었을 경우의 동작을 정의한다.
  }
});
#endif

// Cocoa Design Pattern
//  => macOS Framework - Cocoa Framework
//  => iOS Framework   - Cocoa Touch Framework

// iOS - Button 이벤트
//   Target-Action Pattern

@interface UIButton : NSObject {
  id _target;
  SEL _action;
}

- (void)addTarget:(id)target action:(SEL)action;
- (void)click;

@end

@implementation UIButton

- (void)addTarget:(id)target action:(SEL)action {
  _target = target;
  _action = action;
}

- (void)click {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  [_target performSelector:_action];
}
#pragma clang diagnostic pop

@end

@interface Dialog : NSObject
- (void)close;
@end

@implementation Dialog
- (void)close {
  printf("Dialog close\n");
}
@end


int main() {
  UIButton* button = [[UIButton alloc] init];
  Dialog* dialog = [[Dialog alloc] init];
  
  [button addTarget:dialog action:@selector(close)];
  
  [button click];
}


