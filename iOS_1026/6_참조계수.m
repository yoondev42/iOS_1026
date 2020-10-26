#import <Foundation/Foundation.h>

// ObjC의 '객체 수명 관리'
//  : 중요합니다

// ObjC 메모리 관리 3가지 방법
//  1. MRC(Manual Reference Counting)
//    : 개발자가 직접 참조 계수 관리 코드를 삽입한다.

//  2. ARC(Auto Reference Counting)   - Default
//    : 컴파일러가 컴파일 타임에 코드를 분석해서, 참조 계수 관리 코드를 자동으로 삽입한다.

//  3. GC(Garbage Collection)         - Deprecated
//    : 별도의 런타임이 객체의 수명을 관리한다.

@interface Car : NSObject
// 객체가 메모리에서 파괴되는 시점에 호출되는 메소드: "C++의 소멸자"
- (void)dealloc;

@end

@implementation Car

// dealloc
// ARC: 부모의 dealloc을 자동으로 호출한다.
// MRC: 부모의 dealloc을 명시적으로 호출해야 합니다.
- (void)dealloc {
  printf("Car 객체 파괴\n");
  
  [super dealloc];
}
@end


// 1. 컴파일 옵션을 변경해서, ARC -> MRC 변경해야 합니다.
// 2. MRC에서는 객체의 참조 계수를 증감을 개발자가 직접 관리해야 합니다.
//   참조 계수 증가: retain
//   참조 계수 감소: release
// 3. 참조 계수를 구현하는 기술
//  - Java(VM/GC): 별도의 런타임이 참조 계수를 관리한다.
//   => 런타임에 객체의 메모리를 수거하는 GC가 동작하므로, 런타임 오버헤드가 발생할 수 있다.
//   => 런타임에 추적 관리 하기 때문에 거의 제대로 동작한다.

//  - ObjC/Swift(ARC): 컴파일러가 코드를 분석해서, 참조 계수를 관리하는 코드를 삽입한다.
//   => 런타임에 별도의 프로그램이 동작하는 것이 아니라, 컴파일 타임에 삽입하기 때문에 성능 저하가 거의 없다.
//   => 컴파일러가 제대로 파악할 수 없는 코드에 대해서는 누수의 위험성이 있다.

int main() {
  // 1. 객체 생성시 최초의 참조 계수 값은 1 입니다.
  Car *p1 = [Car new];
  printf("Ref counting: %ld\n", [p1 retainCount]);
  
  // 2. 객체의 포인터 대입 후, 참조 계수는 증가해야 합니다.
  Car *p2 = p1;
  [p2 retain];
  printf("Ref counting: %ld\n", [p1 retainCount]);
  
  // 3. 객체의 포인터를 더 이상 사용하지 않을 경우,
  //    참조 계수를 감소시켜야 합니다.
  [p1 release];
  printf("Ref counting: %ld\n", [p1 retainCount]);  // 1
  [p2 release];                                     // 1 -> 0 (객체 메모리 파괴)
}
