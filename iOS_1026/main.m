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
- (void)dealloc {
  printf("Car 객체 파괴\n");
}
@end

int main() {
  Car *p = [Car new];
  
}
