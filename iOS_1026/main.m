
#import <Foundation/Foundation.h>

// 다형성(Polymorphism)
//  1. 상속 - 부모 타입을 기반으로 다형성을 구현한다.
//  2. 덕 타이핑(Duck typing)    - ObjC는 해당 다형성도 지원합니다.
//    - 특정한 객체가 오리처럼 행동하면 오리로 봐야한다.

@interface User : NSObject
- (void)display;
@end
@implementation User
- (void)display {
  printf("User display\n");
}
@end

@interface Car : NSObject
- (void)display;
@end
@implementation Car
- (void)display {
  printf("Car display\n");
}

@end

@interface Shape : NSObject
- (void)display;
@end
@implementation Shape
- (void)display {
  printf("Shape display\n");
}
@end

int main() {
  User* user = [User new];
  Car* car = [Car new];
  Shape* shape = [Shape new];
  
  NSArray* arr = [NSArray arrayWithObjects:user, car, shape, nil];
  for (int i = 0 ; i < arr.count; ++i) {
    id p = [arr objectAtIndex:i];
    [p display];
    // 해당 객체가 수신된 메소드를 호출할 수 없을 경우, '런타임 오류가 발생'합니다.
  }
}










//  1. 상속 - 부모 타입을 기반으로 다형성을 구현한다.
#if 0
@interface Shape : NSObject
- (void)draw;
@end
@implementation Shape
- (void)draw {
  printf("Shape draw\n");
}
@end

@interface XRect : Shape
- (void)draw;
@end
@implementation XRect
- (void)draw {
  printf("Rect draw\n");
}
@end

@interface XCircle : Shape
- (void)draw;
@end
@implementation XCircle
- (void)draw {
  printf("Circle draw\n");
}
@end

@interface XTriangle : Shape
- (void)draw;
@end
@implementation XTriangle
- (void)draw {
  printf("Triangle draw\n");
}
@end

int main() {
  XRect* rect = [[XRect alloc] init];
  XCircle* circle = [[XCircle alloc] init];
  XTriangle* triangle = [[XTriangle alloc] init];
  NSArray* arr = [NSArray arrayWithObjects:rect, circle, triangle, nil];
  
  for (int i = 0 ; i < arr.count; ++i) {
    Shape* s = [arr objectAtIndex:i];
    [s draw];
  }
}
#endif
