
#import <Foundation/Foundation.h>

// Introspection: 내성, 자기성찰
//   => "Reflection"과 동일한 개념
//   : 실행 시간에 클래스의 정보 등을 탐색하는 목적으로 이용한다.

@interface Car : NSObject
- (void)go;
@end

@implementation Car
- (void)go {
  printf("Car go\n");
}
@end

@interface Truck : Car
- (void)go;
- (void)foo;
@end

@implementation Truck
// Overriding
- (void)go {
  printf("Truck go\n");
}

- (void)foo {
  printf("Truck foo\n");
}
@end

// 1. ObjC의 메소드는 '동적 바인딩'을 합니다.
//  => '런타임에 어떤 객체 타입'을 참조하는지 조사해서, 함수를 호출하는 것
//       Java, C++(virtual)

// 2. Introspection 활용
//    - Class: 클래스 타입의 타입
//   1) 런타임에 어떤 객체 타입인지 알고 싶다.

void foo(Car* p) {
  
  // p가 Truck이면 foo를 호출하고 싶다.
  if ([p class] == [Truck class]) {
    Truck* t = (Truck*)p;
    [t foo];
  } else {
    printf("p는 Truck이 아닙니다.\n");
  }

}


int main() {
  Car* p = [Truck new];
  foo(p);
  
  
  // Class 얻는 방법 3가지
  // 1) 타입
  // Class c1 = [Car class];
  // Class c2 = [Truck class];

  // Car* car = [[Car alloc] init];
  // Truck* truck = [[Truck alloc] init];
  // 2) 객체
  // Class c3 = [car class];
  // Class c4 = [truck class];
  
  // 3) 이름(문자열) - 실패 가능성
  // Class c5 = NSClassFromString(@"Car");
  // NSLog(@"%@", c5);
  
}



#if 0
int main() {
  Car* p1 = [[Car alloc] init];
  [p1 go];
  
  Car* p2 = [[Truck alloc] init];
  [p2 go];
}
#endif






