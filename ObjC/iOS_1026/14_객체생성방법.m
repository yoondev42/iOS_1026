#import <Foundation/Foundation.h>

// 객체 생성 방법 - Obj C
// 1. ARC 원리: 컴파일러가 코드를 분석해서, 자동으로 메모리 관리 코드를 삽입한다.
//             MRC: retain / release
//             ARC: 컴파일러가 C 코드를 삽입한다. 더 빠르게 동작한다.
// 2. 객체 생성 방법
//    1) 2단계 생성 패턴: alloc + initXXX        - 컴파일러가 release 삽입
//    2) 편의 생성자: stringXXX 또는 xxxString    - 컴파일러가 autorelease 삽입


@interface Person : NSObject
@property(strong, nonatomic) NSString* name;

- (id)initWithName:(NSString*)name;
+ (Person*)personWithName:(NSString*)name;

@end

@implementation Person

// 지정 초기화 메소드 - retain / release
- (id)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
    _name = name;
  }
  return self;
}

// 편의 생성자 - AutoReleasePool
+ (Person *)personWithName:(NSString *)name {
  return [[Person alloc] initWithName:name];
}

@end


int main() {
  
  @autoreleasepool {
    // 문자열을 생성하는 방법 3가지
    NSString* s1 = @"Hello";     // Literal
    NSString* s2 = [[NSString alloc] initWithFormat:@"%@", s1];
    NSString* s3 = [NSString stringWithFormat:@"%@", s2];
    
    NSLog(@"%@ %@ %@", s1, s2, s3);
    
    NSArray* arr1 = [[NSArray alloc] initWithObjects:@"A", @"B", nil];
    NSArray* arr2 = [NSArray arrayWithObjects:@"A", @"B", nil];
    
    NSLog(@"%@ %@", arr1, arr2);
    
    Person* p1 = [[Person alloc] initWithName:@"Tom"];
    Person* p2 = [Person personWithName:@"Tom"];
    
    NSLog(@"%@ %@", p1, p2);
  }
}
