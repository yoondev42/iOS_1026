// 프로퍼티
#import <Foundation/Foundation.h>

@interface User : NSObject {
  NSString* _name;
  int _age;
}

- (id)initWithName:(NSString*)name age:(int)age;

- (NSString*)name;
- (int)age;

@end

@implementation User

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

int main() {
  User* user = [[User alloc] initWithName:@"Tom" age:42];
  NSLog(@"%@(%d)", [user name], [user age]);
}
