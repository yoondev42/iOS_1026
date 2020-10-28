// 메소드
// 1. 여러 개의 인자를 가지는 메소드를 정의하는 방법
// 2. 함수 오버로딩
//    : 인자의 정보가 함수의 심볼에 포함되기 때문에, 네임 맹글링이 불필요하다.

#import <Foundation/Foundation.h>

// C++ / Java - 오버로딩
//  : 컴파일러가 인자의 정보에 따라 이름을 변형한다. - 네임 맹글링
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

// go
- (void)go {
  printf("go0\n");
}

// go:
- (void)go:(int)a {
  printf("go1: %d\n", a);
}

// go:speed:
- (void)go:(int)a speed:(int)speed {
  printf("go2: %d %d\n", a, speed);
}

// go:speed:color:
- (void)go:(int)a speed:(int)speed color:(int)color {
  printf("go3: %d %d %d\n", a, speed, color);
}

// go:speed:color:name:
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
  
  // car.go(10, 20, 30);
  [car go:10 speed:20 color:30];
  
  // car.go(10, 20, 30, "Tom");
  [car go:10
    speed:20
    color:30
     name:@"Tom"];
}





















