// 메소드
// 1. 여러 개의 인자를 가지는 메소드를 정의하는 방법
// 2. 함수 오버로딩
#import <Foundation/Foundation.h>

#if 0
class Car {
public:
  void go();
  void go(int a);
  void go(int a, int speed);
  
  void go(int a  int speed, int color);
  void go(int a, int speed, int color, NSString* name);
};
#endif

@interface Car : NSObject

- (void)go;
- (void)go:(int)a;

// 인자를 2개 이상 전달하는 방법
- (void)go:(int)a speed:(int)speed;

@end

@implementation Car

- (void)go {
  printf("go0\n");
}

- (void)go:(int)a {
  printf("go1: %d\n", a);
}

- (void)go:(int)a speed:(int)speed {
  printf("go2: %d %d\n", a, speed);
}

@end

int main() {
  Car* car = [Car new];
  
  [car go];
  
  // car.go(42);
  [car go:42];
  
  // car.go(42, 100);
  [car go:42 speed:100];
  
}





















