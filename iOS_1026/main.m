// 프로퍼티
#import <Foundation/Foundation.h>

@interface User : NSObject {
  NSString* _name;
  int _age;
}

- (id)initWithName:(NSString*)name age:(int)age;

// 중요: ObjC의 Getter / Setter의 이름 규칙은 매우 중요합니다.
- (NSString*)name;
- (int)age;

- (void)setName:(NSString*)name;
- (void)setAge:(int)age;

@end

@implementation User

- (void)setName:(NSString*)name {
  _name = name;
}

- (void)setAge:(int)age {
  _age = age;
}

- (NSString*)name {
  return _name;
}

- (int)age {
  return _age;
}

- (id)initWithName:(NSString*)name age:(int)age {
  self = [super init];
  if (self) {
    _name = name;
    _age = age;
  }
  return self;
}

@end

// 1. ObjC에서 Getter / Setter의 이름 규칙을 제대로 사용한다면
//    닷 연산자를 이용해서 Getter / Setter를 호출할 수 있습니다.

int main() {
  User* user = [[User alloc] initWithName:@"Tom" age:42];
  NSLog(@"%@(%d)", [user name], [user age]);
  
  [user setName:@"Bob"];
  [user setAge:16];
  NSLog(@"%@(%d)", [user name], [user age]);
  
  user.name = @"Alice";  // [user setName:@"Alice"];
  user.age = 24;         // [user setAge:24];
  
  NSLog(@"%@(%d)", user.name, user.age);
  //             [user name], [user age]
}
