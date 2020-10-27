
// 1. 확장자
//      .m :  C언어 + Objective-C
//     .mm :  C++  + Objective-C
//      m: Message의 약자

// 2. Xcode
//           Build: Command + B
//     Build + Run: Command + R

// 3. 헤더파일
#import <Foundation/Foundation.h>
// ObjC의 핵심 기능을 모아놓은 헤더파일의 집합

// #include: 중복 포함에 대해서 고려해야한다.
//           => include guard
// #import: include + include guard
//          GNU Compiler의 확장 기능을 이용합니다.

// 4. ObjC의 이름 규칙
//     - NS 접두: NextStep(OS -> macOS)
//      : namespace / package 같은 이름 충돌을 막는 문법이 제공되지 않습니다.

int main() {
  // C의 문자열
  const char *s1 = "Hello, C";
  printf("%s\n", s1);
  
  // ObjC의 문자열 클래스 - NSString
  // - ObjC의 모든 객체는 반드시 힙에 생성되어야 합니다.
  NSString *s2 = @"Hello, ObjC";
  NSLog(@"k", s2);
}


#if 0
#include <stdio.h>

int main() {
  printf("Hello, world..\n");
}
#endif
