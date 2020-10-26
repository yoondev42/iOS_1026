// Auto Release Pool
#import <Foundation/Foundation.h>

@interface Car : NSObject {
  int _red;
  int _green;
  int _blue;
}

- (id)initWithRed:(int)red green:(int)green blue:(int)blue;
- (void)dealloc;

// 편의 생성자
//   Java: 정적 팩토리 메소드
+ (Car*)redCar;
+ (Car*)greenCar;
// 메소드를 통해 생성되는 객체의 수명은 사용자가 아니라, 자동 해체풀(Auto Release Pool)을 이용해서 관리하자.

@end

@implementation Car

- (void)dealloc {
  printf("Car 객체 파괴\n");
  [super dealloc];
}

+ (Car*)redCar {
  return [[[Car alloc] initWithRed:255 green:0 blue:0] autorelease];;
}

+ (Car*)greenCar {
  // 생성된 객체를 autoreleasepool에 등록한다.
  return [[[Car alloc] initWithRed:0 green:255 blue:0] autorelease];
}

- (id)initWithRed:(int)red green:(int)green blue:(int)blue {
  self = [super init];
  if (self) {
    _red = red;
    _green = green;
    _blue = blue;
  }
  return self;
}

@end

void foo(Car* p) {
  
}


int main() {
  // Car* c1 = [[Car alloc] initWithRed:255 green:0 blue:0];  // Car - red
  // Car* c2 = [[Car alloc] initWithRed:0 green:255 blue:0];  // Car - green
  
  
  // '자동 해체풀'을 만드는 방법
  NSAutoreleasePool* pool = [NSAutoreleasePool new];  // [NSAutoReleasePool alloc] init]];
  
  Car* c1 = [Car redCar];
  foo(c1);

  // Car* c2 = [Car greenCar];
  foo([Car greenCar]);
  
  [pool release]; // pool에 등록된 모든 객체에게 release 메세지를 전달한다.
  
}










// C 언어
#if 0
struct data {
  int n;
};

struct data* foo() {
  // struct data v;
  // return &v;
  // 해결 방법 2가지
  
  // 1. malloc
  //   문제점: 더 이상 사용하지 않을 경우, 반드시 free를 해주어야 한다.
  //   ex) strdup
  // struct data* p = malloc(sizeof(struct data));
  // p->n = 100;
  // return p;
  
  // 2. static - 내부 정적 변수
  //   문제점: 재진입이 불가능한 함수
  //         "재귀 X", "스레드 안전하지 않다"
  static struct data v = { 100 };
  return &v;
}

int main() {
  struct data* p = foo();
  printf("%d\n", p->n);

  // free(p);
}
#endif
