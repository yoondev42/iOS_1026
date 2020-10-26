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

- (void)go:(int)a speed:(int)speed color:(int)color;
- (void)go:(int)a speed:(int)speed color:(int)color name:(NSString*)name;

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

- (void)go:(int)a speed:(int)speed color:(int)color {
  printf("go3: %d %d %d\n", a, speed, color);
}

- (void)go:(int)a speed:(int)speed color:(int)color name:(NSString*)name {
  printf("go4: %d %d %d %s\n", a, speed, color, [name UTF8String]);
}

@end

int main() {
  Car* car = [Car new];
  
  [car go];
  
  // car.go(42);
  [car go:42];
  
  // car.go(42, 100);
  [car go:42 speed:100];
  
  [car go:10 speed:20 color:30];
  
  [car go:10 speed:20 color:30 name:@"Tom"];
}





















