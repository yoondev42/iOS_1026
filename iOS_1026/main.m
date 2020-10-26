#import <Foundation/Foundation.h>

// 소유권 있음: 강한 참조
//    - 참조 계수를 증가시키거나, 감소시킨다.

// 소유권 없음: 약한 참조
//    - 참조 계수를 조작하지 않음.
//    문제점: 소유한 객체가 먼저 파괴될 가능성이 존재한다. - 댕글링 포인터

//    weak: auto-niling
//         - 참조하고자 하는 객체가 이미 파괴된 경우, 포인터의 값을 nil로 변경해준다.

//    unsafe_unretained: auto-niling X
//         - auto-niling을 지원하지 않습니다.
//         - weak 보다 조금 빠릅니다.
//         - 이미 파괴된 객체를 참조할 위험성이 존재한다.

@class Phone;
@interface Person : NSObject
@property(weak) Phone* phone;
@end

@implementation Person

@end

@interface Phone : NSObject

- (void)foo;

- (void)dealloc;
@end

@implementation Phone {
  int _age[100];
}

- (void)foo {
  memset(&_age, 0, sizeof _age);
}

- (void)dealloc {
  printf("Phone 객체 파괴\n");
}
@end

int main() {
  Phone* phone = [[Phone alloc] init];
  Person* person = [[Person alloc] init];
  
  person.phone = phone;
  // [person setPhone:phone];
  
  phone = nil;
  
  if (person.phone) {
    printf("%p\n", person.phone);
    [person.phone foo];
  } else {
    printf("%p - 이미 파괴되었음.\n", person.phone);
  }
  
  
}
