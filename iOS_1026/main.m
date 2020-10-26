#import <Foundation/Foundation.h>

// 소유권(Ownership)
//  있다: Person객체가 Phone객체를 참조하는 동안 반드시 Phone객체는 존재해야 한다.
//       dealloc이 호출되면 안된다.
//       setPhone을 하는 순간, 참조 계수가 증가해야 한다.

//  없다: Person객체가 Phone객체를 참조하는 동안 Phone 객체가 파괴될 가능성이 있다.
//       dealloc이 호출될 가능성이 있다.
//       setPhone을 하는 순간, 참조 계수는 증가하지 않는다.

// 소유권이 있을 경우
@class Phone;
@interface Person : NSObject {
  Phone* _phone;
}

- (id)initWithPhone:(Phone*)phone;

- (void)setPhone:(Phone*)phone;
- (void)dealloc;

@end
@implementation Person

- (id)initWithPhone:(Phone *)phone {
  self = [super init];
  if (self) {
    // _phone = phone;
    // [_phone retain];
    
    _phone = [phone retain];
    // 자신이 소유한 객체의 참조 계수를 증가해야 합니다.
  }
  
  return self;
}


- (void)setPhone:(Phone *)phone {
  // 3. 기존 객체와 동일한 객체가 아닌지 체크해야 한다.
  if (phone != _phone) {
    // 1. 기존 객체의 참조 계수를 감소해야 한다.
    [_phone release];
    _phone = phone;
    // 2. 새로운 객체의 참조 계수를 증가해야 한다.
    [phone retain];
  }
}

- (void)dealloc {
  printf("Person 객체 파괴\n");
  // 1. 자신이 소유한 객체의 참조 계수를 감소해야 한다.
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
  [person setPhone:phone];
  printf("phone: %ld\n", [phone retainCount]);
  
  [phone release];
  [person release];
}





