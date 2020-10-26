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

@interface Car : NSObject {
  int _color;
}

- (id)init;
- (int)color;
// ObjC에서는 getter를 만들때 필드의 _를 제거한 이름을 사용하는 것이 원칙입니다.

@end

@implementation Car

- (int)color {
  return _color;
}

// 2. ObjC에서 초기화 메소드를 만드는 방법
//  - 초기화 메소드에서는 self의 값을 변경하는 것이 가능합니다.

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
@end

int main() {
  Car* car = [Car new];
  printf("color: %d\n", [car color]);
}
