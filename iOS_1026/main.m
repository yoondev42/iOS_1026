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
};
#endif

@interface Car : NSObject

- (void)go;

- (void)go:(int)a;

@end

@implementation Car

- (void)go {
  printf("go0\n");
}

- (void)go:(int)a {
  printf("go1: %d\n", a);
}

@end

int main() {
  Car* car = [Car new];
  
  [car go];
  
  // car.go(42);
  [car go:42];
  
}





















