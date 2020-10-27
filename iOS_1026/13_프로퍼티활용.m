
#import <Foundation/Foundation.h>

// 프로퍼티에 접근하는 방법
//  1. 객체 외부 - 접근자 메소드(닷 연산자)
//  2. 객체 내부 - 접근자 메소드(닷 연산자) / 메모리에 직접 접근하는 방법
//    - 객체 내부에서 인스턴스 변수(필드)에 접근할 때
//      읽을 때는 직접 접근하고, 쓸때는 접근자 메소드(닷 연산자)를 이용하는 것이 좋다.
//    예외>
//      1. 초기화 메소드를 정의할 때 필드의 값을 설정할 때는 직접 접근 해야 한다.
//      2. 초기화 메소드를 통해 초기화하고자 하는 필드가 부모의 필드인 경우, 부모의 Setter를 이용해서 초기화 해야 한다.
//      3. 프로퍼티가 지연 초기화(Lazy Initilization)롤 통해 생성되는 경우, 반드시 직접 접근이 아니라 Getter를 이용해야 한다.
//       - 지연 초기화
//         : 초기화 시점에 객체를 바로 생성하는 것이 아니라, 처음 접근되는 시점에 생성하는 기술

@interface Image : NSObject
- (id)init;
@end
@implementation Image

- (id)init {
  printf("Image 객체 생성\n");
  self = [super init];
  if (self) {
    
  }
  return self;
}

@end

@interface Person : NSObject

@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;

@property(strong, nonatomic) Image* image;
@property(assign, nonatomic) int age;
// 1. _age 필드 생성 = backing field
// 2. age getter 생성
// 3. age setter 생성
//  => getter / setter를 재정의하면, 필드를 생성하지 않습니다.


- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;
- (void)print;

// 지연 초기화를 위해서 Getter를 재정의해야 한다.
- (Image*)image;

- (int)age;
- (void)setAge:(int)age;


@end

@implementation Person

// 프로퍼티의 필드의 이름을 수동으로 지정하는 것이 가능합니다.
@synthesize age = _age;
// 1. readwrite
//    - getter / setter 재정의 한경우
// 2. readonly
//    - getter 를 재정의 한경우

- (int)age {
  // 무조건 메모리에 직접 접근해야 합니다.
  // 직접 접근하지 않을 경우, 재귀 코드가 됩니다.
  // return self.age;
  printf("hello\n");
  return _age;
}

- (void)setAge:(int)age {
  // 무조건 메모리에 직접 접근해야 합니다.
  // self.age = age;
  printf("hello\n");
  _age = age;
}

- (Image*)image {
  if (_image == nil)
    _image = [[Image alloc] init];
  
  return _image;
}

- (void)print {
  NSLog(@"%@, %@, %p", _firstName, _lastName, self.image);
}

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName {
  printf("Person 객체 생성\n");
  self = [super init];
  
  if (self) {
    // 1. 직접 접근
    _firstName = firstName;
    _lastName = lastName;
    _age = 100;
    // 2. 접근자 메소드
    // self.firstName = firstName;
    // self.lastName = lastName;
    // 위 처럼 사용할 경우, Person의 자식 클래스가 setter를 오버라이딩 한경우, 제대로 초기화되지 않을 수 있다.
  }
  
  return self;
}

@end

int main() {
  Person* person = [[Person alloc] initWithFirstName:@"Gildong" lastName:@"Hong"];
  printf("Person 객체 생성 후\n");
  
  [person print];
  printf("%p\n", person.image);
  
  printf("%d\n", person.age);
}
