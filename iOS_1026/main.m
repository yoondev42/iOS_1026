#import <Foundation/Foundation.h>

// 셀렉터(Selector)
//  : Objective C의 메소드를 참조하는 타입
//  => C 함수 포인터: 함수를 참조하고, 실행 시간에 어떤 함수를 호출할 지 결정할 수 있다.

@interface Car : NSObject
- (void)go;
- (void)foo;
@end

@implementation Car
- (void)go {
  printf("Car go\n");
}

- (void)foo {
  printf("Car foo\n");
}
@end

int main() {
  Car* car = [Car new];
  
  SEL s1 = @selector(go);
  // s1 = @selector(foo);
  
  // PerformSelector may cause a leak because its selector is unknown
  //  - ARC는 Selector를 통해 생성된 객체의 수명관리가 불가능하다.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  [car performSelector:s1];
#pragma clang diagnostic pop
  
  [car performSelector:s1];
}



#if 0
int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }

int main() {
  int (*fp)(int, int) = &add;
  // fp = &sub;
  
  printf("%d\n", fp(10, 20));
}
#endif
