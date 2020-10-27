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
- (void)go;
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
