
#import <Foundation/Foundation.h>

// KVC
//  : Key-Value Coding
//  => 객체의 프로퍼티의 이름을 키 값으로 해서, 프로퍼티의 값을 읽거나 변경하는 기술
//  문제점
//   - 잘못된 키 값을 전달하였을 경우, 예외가 발생합니다.
//     this class is not key value coding-compliant for the key n2.

// Cocoa Touch Framework
//  => UI 컴포넌트의 참조와 코드를 연결할 때, KVC가 이용됩니다.


// User* user = [[User alloc] initWithName:@"Tom" age:42];

// user.name = @"Bob";
// user.age = 35;

// NSString* n = user.name;
// int a = user.age;

@interface User : NSObject

@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;
@property(assign, nonatomic) int n;

@end

@implementation User
@end

int main() {
  User* user = [[User alloc] init];
  user.name = @"Tom";
  user.age = 42;
  user.n = 100;
  
  NSString* input = @"n2";
  // 사용자로부터 입력을 받는다.
  // "age"를 입력받으면 user.age를 출력하고,
  // "name"을 입력받으면 user.name을 출력한다.
  
  if ([input isEqualToString:@"age"]) {
    NSLog(@"%d", user.age);
  } else if ([input isEqualToString:@"name"]) {
    NSLog(@"%@", user.name);
  }
  // 프로퍼티가 추가될 때마다 위의 코드는 계속 변경되어야 한다.
  // 프로퍼티를 사전처럼 접근할 수 있다면, 편리하다. - KVC
  
  id value = [user valueForKey:input];
  // name을 입력받으면, name 값을 준다.
  // age를 입력받으면, age 값을 준다.
  NSLog(@"%@", value);
  
}
