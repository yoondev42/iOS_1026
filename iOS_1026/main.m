
#import <Foundation/Foundation.h>

// 접근자 메소드를 직접 작성하는 경우보다는 프로퍼티를 이용해서 작성하는 경우가 많습니다.
//  의도
//    소유권 O
//    소유권 X

@class Phone;
@interface Person : NSObject

// 소유권 O
@property(retain) Phone* phone;

- (id)initWithPhone:(Phone*)phone;
- (void)dealloc;

@end

@implementation Person

- (id)initWithPhone:(Phone *)phone {
  self = [super init];
  if (self) {
    _phone = [phone retain];
  }
  return self;
}

- (void)dealloc {
  printf("Person 객체 파괴\n");
  [_phone release];
  [super dealloc];
}

@end

@interface Phone : NSObject
- (void)dealloc;
@end

@implementation Phone
- (void)dealloc {
  printf("Phone 객체 파괴\n");
  [super dealloc];
}
@end

int main() {
  Person* person = [[Person alloc] init];
  Phone* phone = [[Phone alloc] init];
  
  [person setPhone:phone];
  printf("phone: %ld\n", [phone retainCount]);
  
  [phone release];
  [person release];
}
