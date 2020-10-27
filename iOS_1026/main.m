#import <Foundation/Foundation.h>

// 셀렉터(Selector)
//  : Objective C의 메소드를 참조하는 타입
//  => C 함수 포인터: 함수를 참조하고, 실행 시간에 어떤 함수를 호출할 지 결정할 수 있다.

@interface Car : NSObject
- (void)go;
- (void)foo;
@end

@implementation Car
// 고유번호: 10
- (void)go {
  printf("Car go\n");
}

- (void)foo {
  printf("Car foo\n");
}

- (void)go:(NSNumber*)a {
  // printf("Car go: %d\n", a);
  NSLog(@"%@", a);
}

@end

@interface User : NSObject
- (void)go:(int)a;
@end
@implementation User
// go - 고유번호: 10
- (void)go:(int)a {
  printf("User go - %d\n", a);
}
@end

// Obj-C는 메소드를 'C 함수로 컴파일해서 관리'한다.
// - 아래 코드는 원리를 확인하기 위한 코드 입니다.
//  : 메소드를 C 함수 포인터로 변환해서 호출이 가능합니다.
int main() {
  // Car* obj = [Car new];
  User* obj = [User new];
  SEL s = @selector(go:);
  
  typedef void (*FP)(id, SEL, ...);
  FP f = (FP)[obj methodForSelector:s];
  
  f(obj, s, 42);
}

// [Selector 정리]
// 1. 메소드를 참조하는 타입 - '고유번호'를 통해 관리된다.
// 2. 고유 번호는 메소드의 이름에 의해서 결정된다.
//   => 다른 클래스 타입이 동일한 이름의 메소드를 가지고 있다면, 같은 고유번호를 가진다.
//   - (void)go                            ->     go
//   - (void)go:(int)a                     ->     go:
//   - (void)go:(int)a speed:(int)speed    ->     go:speed:
// 3. 메소드는 C언어 함수로 컴파일된다.
//   => 함수 포인터를 통해 해당 메소드를 호출하는 것이 가능하다.
// 4. ARC에서 누수의 위험성이 있다.
//   => 컴파일러가 코드를 분석해서 참조 계수 관리 코드를 삽입해야 하는데,
//      실행 시간에 어떤 함수가 호출될지 알 수 없기 때문에,
//      적절한 참조 계수 관리 코드 삽입이 불가능하다.
//      : performSelector - 객체가 생성되는 메소드에 대해서는 사용하지 않는 것이 좋다.


#if 0
int main() {
  Car* car = [Car new];
  
  // SEL: 메소드의 고유 번호 - 이름에 의해서 결정된다.
  SEL s1 = @selector(go);
  s1 = @selector(foo);
  s1 = @selector(go:);
  
  // PerformSelector may cause a leak because its selector is unknown
  //  - ARC는 Selector를 통해 생성된 객체의 수명관리가 불가능하다.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  // [car performSelector:s1];
  [car performSelector:s1 withObject:[NSNumber numberWithInt:42]];
#pragma clang diagnostic pop

}
#endif



#if 0
int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }

int main() {
  int (*fp)(int, int) = &add;
  // fp = &sub;
  
  printf("%d\n", fp(10, 20));
}
#endif
