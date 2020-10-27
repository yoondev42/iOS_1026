
#import <Foundation/Foundation.h>

// 1. 객체를 문자열로 출력할 때 - description
// 2. Objective C에서 객체를 복사하는 방법 - Java: Cloneable / clone
//   1) <NSCopying> Protocol 구현
//   2) - (id)copyWithZone:(nullable NSZone *)zone 구현
// 3. Setter에서 방어 복사본을 참조하는 방법
//   @property(copy, nonatomic) Person* person;

@interface Person : NSObject<NSCopying>
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic, readonly) int age;

- (id)initWithName:(NSString*)name age:(int)age;

@end

@implementation Person

// 'Dictionary'로 만들고, descipriton을 사용하면 편리하다.
- (NSString*)description {
  return [@{
    @"name": _name,
    @"age": [NSNumber numberWithInt:_age],
  } description];
}

- (id)initWithName:(NSString*)name age:(int)age {
  self = [super init];
  if (self) {
    _name = name;
    _age = age;
  }
  return self;
}

- (void)foo {
  _age = 100;
}

// 일반 객체 생성 방법
// 1. alloc
// 2. initXXX

// 복사본 생성 방법
// 1. allocWithZone:    -  복사본 객체는 원본의 메모리 인접 영역에 생성한다.
// 2. initXXX

// 아래 함수에서 객체의 복사본을 생성하면 됩니다.
- (id)copyWithZone:(nullable NSZone *)zone {
  return [[Person allocWithZone:zone] initWithName:_name age:_age];
}

@end

@interface Company : NSObject
// @property(strong, nonatomic) Person* person;
@property(copy, nonatomic) Person* person;

- (id)initWithPerson:(Person*)person;

@end

@implementation Company

- (NSString*)description {
  return [@{
    @"person": _person,
  } description];
}

- (id)initWithPerson:(Person*)person {
  self = [super init];
  if (self) {
    // _person = person;
    _person = [person copy];  // 복사본을 참조한다.
  }
  return self;
}

@end

int main() {
  Person* person = [[Person alloc] initWithName:@"Tom" age:42];
  Company* company = [[Company alloc] initWithPerson:person];

  // Setter도 방어 복사본이 필요하다.
  company.person = person;
  
  // company 객체가 알 수 없다.
  person.name = @"Bob";
  [person foo];
  
  // 해결방법: 단순히 person 객체를 불변 객체로 만드는 것도 중요하지만,
  //         company가 person의 참조를 바로 사용하면 안된다.
  //         => "방어 복사본"
  
  
  
  
  NSLog(@"Person: %@", person);
  NSLog(@"Company: %@", company);
}





