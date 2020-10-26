#import <Foundation/Foundation.h>

// Property Attribute(ARC)
// 1. 메모리 관리 속성
//   strong                                        - 기본 속성
//   weak(autoniling) / unsafe_unretained
//   assign: built-in type(int, char, double ...)
//   copy: 복사
//      - 객체를 복사하는 방법에서 다룹니다.

// 2. 동기화 속성
//   atomic: 스레드 동기화 - 동시의 여러개의 스레드에서 값을 변경하거나 읽는 작업이 안전하다.         - 기본 속성
//   nonatomic: 스레드 동기화 X - 동시의 여러개의 스레드에서 값을 변경하거나 읽는 작업이 안전하지 않다.
//   : 대부분의 경우 여러개의 스레드에서 접근하는 경우가 아니라면,
//     nonatomic을 사용하는 것이 좋다.
// * 프로퍼티의 메모리 관리 속성과 동기화 속성은 명시적으로 표현하는 것이 좋다.

// 3. 접근자 메소드 생성
//   readonly: getter
//   readwrite: getter + setter        - 기본 속성(생략)

@interface User : NSObject
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic, readonly) int age;
@end

@implementation User
@end

int main() {
  User* user = [[User alloc] init];
  user.name = @"Tom";
  // user.age = 42;
  
  NSLog(@"%@(%d)", user.name, user.age);
}
