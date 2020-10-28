
#import <Foundation/Foundation.h>

// 리터럴 문법
//  1. Objective C가 제공하는 Collection 사용 방법

int main() {
  // 1. 문자열
  NSString* s = @"Hello, ObjC";
  NSLog(@"%@", s);
  
  // 2. 배열
  //   NSArray
  //     id 타입을 여러개 보관할 수 있다.
  //     문제점: 기본 타입(built-in)을 저장하는 것이 불가능하다.
  //           래퍼 클래스가 필요하다.
  //           Auto boxing / unboxing 을 지원하지 않습니다.
  
  NSArray* arr = [NSArray arrayWithObjects:
                  [NSNumber numberWithInt:10],
                  [NSNumber numberWithInt:20],
                  [NSNumber numberWithInt:30], nil];
  NSLog(@"%@", [arr objectAtIndex:0]);
  
  // Objective C: 2.0 - Literal 문법 지원
  NSArray* arr2 = @[ @10, @20, @30 ];
  NSLog(@"%@", arr2[0]);   // [arr2 objectAtIndex:0];
  
  
  // 3. NSDictionary(= Map)
  //  주의: value 부터 나열해야 한다.
  NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Tom", @"name",
                       @42, @"age",
                       nil];
  NSLog(@"%@", [dic objectForKey:@"name"]);
  NSLog(@"%@", [dic objectForKey:@"age"]);
  
  //------------------------
  
  NSDictionary* dic2 = @{
    @"name" : @"Tom",
    @"age" : @42
  };
  
  NSLog(@"%@", dic2[@"name"]);
  NSLog(@"%@", dic2[@"age"]);
  
}
