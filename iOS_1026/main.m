
#import <Foundation/Foundation.h>
// 불변객체(Immutable Object)
//   정의: 객체가 생성된 이후에 값이 변경되지 않는 객체
//
//  Java: String <- StringBuilder
//        Integer, Long
//        LocalDate, LocalDateTime

// 장점
//   1. 상태가 변경되지 않기 때문에, 부수효과로 인한 버그로부터 안전하다.
//   2. 스레드에 안전하다.
//   3. 값이 변경되지 않기 때문에, 동일한 값을 가지는 객체를 공유해서 사용할 수 있다.

// Objective-C Collection
//   불변객체: NSString / NSArray / NSDictionary
//   가변객체: NSMutableString / NSMutableArray / NSMutableDictionary

int main() {
  
  NSMutableDictionary* dic = [@{ @"name": @"Tom" } mutableCopy];
  dic[@"age"] = @42;
  NSLog(@"%@", dic[@"age"]);
  
  [dic removeObjectForKey:@"name"];
  NSLog(@"%@", dic[@"name"]);
  
  // NSArray* arr = @[ @10, @20 ];
  // arr[0] = @30;
  NSMutableArray* arr = [@[ @10, @20 ] mutableCopy];
  arr[0] = @30;
  
  [arr addObject:@100];

  
  
  // NSString* s1 = @"AAA";
  // NSMutableString* s1 = [NSMutableString stringWithString:@"AAA"];
  NSMutableString* s1 = [@"AAA" mutableCopy];
  
  //   NSRange: struct
  // NSString*: class
  
  NSRange range = NSMakeRange(1, 2);
  [s1 replaceCharactersInRange:range withString:@"BB"];
  NSLog(@"%@", s1);
}



