#import <Foundation/Foundation.h>

#if 0
class Car {
  int color;
public:
  Car(): color(0) {}                  // 기본 생성자
  Car(int n): color(n) {}
};
#endif

// 초기화 메소드
//   => "생성자" 개념과 동일합니다.

// 1. ObjC에서는 필드의 이름규칙
//      _color, _age, _speed

// 아래 필드를 초기화하는 초기화 메소드를 직접 만들어보시고, 2단계 생성 패턴을 이용해서 사용하는 코드도 만들어보세요.
@interface Car : NSObject {
  int _color;
  int _speed;
}

// ObjC는 아래처럼 id를 반환하고, init으로 시작하는 메소드를 초기화 메소드로 취급합니다.
- (id)init;
- (id)initWithColor:(int)color;

// 지정 초기화 메소드 - Designated Initializer
//  : 클래스의 모든 필드를 온전하게 초기화하는 메소드
//    클래스를 설계한 사람이 의도한 초기화 메소드
- (id)initWithColor:(int)color speed:(int)speed;


- (int)color;
- (int)speed;
// ObjC에서는 getter를 만들때 필드의 _를 제거한 이름을 사용하는 것이 원칙입니다.

@end

@implementation Car

- (int)color {
  return _color;
}

- (int)speed {
  return _speed;
}

// 2. ObjC에서 초기화 메소드를 만드는 방법
//  - 초기화 메소드에서는 self의 값을 변경하는 것이 가능합니다.

// void*: 모든 타입의 포인터(참조)를 담을 수 있는 타입
//    id: 모든 객체 타입의 포인터를 담을 수 있는 타입

// NULL:  #define NULL (void*)0
//  nil:  #define nil  (id)0

- (id)init {
  printf("init\n");
  // 1. 부모의 초기화 메소드를 명시적으로 호출합니다.
  //    초기화 메소드가 실패할 경우, nil을 반환합니다.
  self = [super init];
  
  // 2. 부모의 초기화메소드가 실패하지 않을 경우, 자신의 필드를 초기화합니다.
  if (self != nil) {  // if (self) {
    _color = 42;
  }
  
  // 3. self를 반환합니다.
  return self;
}

- (id)initWithColor:(int)color {
  printf("initWithColor:\n");
  self = [super init];
  if (self) {
    _color = color;
  }
  return self;
}

- (id)initWithColor:(int)color speed:(int)speed {
  printf("initWithColor:speed:\n");
  self = [super init];
  if (self) {
    _color = color;
    _speed = speed;
  }
  
  return self;
}

@end

// 1. ObjC 에서는 부모의 초기화 메소드를 상속 받는다.
//  => 잘못된 초기화 메소드를 호출할 경우, 부모 객체의 필드가 온전하게 초기화되지 않을 위험성이 있다.
// 2. 반드시 상속을 통해 부모의 초기화 메소드를 호출 할 때, 지정 초기화 메소드를 호출해야 한다.

@interface Truck : Car {
  int _age;
}

// 부모의 필드를 온전하게 초기화할 수 있는 초기화 메소드를 설계해야 한다.
- (instancetype)initWithColor:(int)color speed:(int)speed age:(int)age;

- (int)age;

@end

@implementation Truck

- (int)age {
  return _age;
}

// 초기화 메소드에서만 사용할 수 있는 키워드
// => 실제 타입 정보를 기반으로 컴파일 경고를 주는 역활
- (instancetype)initWithColor:(int)color speed:(int)speed age:(int)age {
  // 1. 부모의 '지정 초기화 메소드'를 호출한다.
  self = [super initWithColor:color speed:speed];
  
  // 2. 자신의 필드를 초기화한다.
  if (self) {
    _age = age;
  }
  
  return self;
}

@end

@interface User : NSObject
@end

@implementation User
@end


int main() {
  // User* u = [[Truck alloc] initWithColor:100 speed:20 age:30];
  
  
  Truck* t = [[Truck alloc] initWithColor:100 speed:42 age:35];
  NSLog(@"%d %d %d", [t color], [t speed], [t age]);
}




// new: 무조건 init을 호출합니다.
//  1. 메모리를 할당합니다.                   -  Car* obj = [Car alloc];
//  2. 할당된 메모리를 대상으로 init을 호출합니다. - [obj init];

// init이 아닌 사용자가 정의한 초기화 메소드를 사용하기 위해서는
// 객체의 메모리 할당과 초기화 메소드를 직접 호출해야 한다.
//  => 2단계 생성 패턴

#if 0
int main() {
  // Car* car = [Car new];
  
  // Car* car = [Car alloc];
  // car = [car initWithColor:100];
  
  Car* car = [[Car alloc] initWithColor:100];
  printf("color: %d\n", [car color]);
  
  Car* car2 = [[Car alloc] initWithColor:100 speed:42];
  printf("color: %d, speed: %d\n", [car2 color], [car2 speed]);
}
#endif
