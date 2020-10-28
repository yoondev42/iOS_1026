#import <Foundation/Foundation.h>

// 프로퍼티 속성(ARC)
@class Phone;
@interface Person : NSObject

// 소유권 - MRC / ARC 프로퍼티 속성에 대한 키워드가 변경되었습니다.

//                     MRC                    ARC
// 소유권 있음           retain                 strong
// 소유권 없음           assign                 weak
//                                           unsafe_unretained
// 기본 타입            assign                 assign

// @property(strong) Phone* phone;
@property(weak) Phone* phone;
@property(assign) int age;
// 위의 기본 타입(built-in type)은 참조 계수를 통해 수명 관리되지 않습니다.


// 소유권 O
// @property(strong) Phone* phone;
// - setPhone(retain) / init(retain) / dealloc(release)

// 소유권 X
// @property(weak) Phone* phone;
// @property(unsafe_unretained) Phone* phone;
// - setPhone / init / dealloc


- (id)initWithPhone:(Phone*)phone;
- (void)dealloc;

@end

@implementation Person

- (id)initWithPhone:(Phone*)phone {
  self = [super init];
  if (self) {
    _phone = phone;
    // strong: _phone = [phone retain];
    // weak, unsafe_unretained: _phone = phone;
  }
  return self;
}

- (void)dealloc {
  printf("Person dealloc\n");
  // strong: [phone release];
  // weak, unsafe_unretained: X
}

@end

@interface Phone : NSObject
- (void)dealloc;
@end

@implementation Phone
- (void)dealloc {
  printf("Phone dealloc\n");
}
@end

int main() {
  Person* person = [[Person alloc] init];
  Phone* phone = [[Phone alloc] init];
  
  [person setPhone:phone];
  printf("phone = nil\n");
  phone = nil;
  printf("person = nil\n");
  person = nil;
  
  printf("main end\n");
}





