
#import <Foundation/Foundation.h>

// 1. 객체를 문자열로 출력할 때 - description


@interface Person : NSObject
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;

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

@end

@interface Company : NSObject
@property(strong, nonatomic) Person* person;

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
    _person = person;
  }
  return self;
}

@end

int main() {
  Person* person = [[Person alloc] initWithName:@"Tom" age:42];
  Company* company = [[Company alloc] initWithPerson:person];
  
  NSLog(@"Person: %@", person);
  NSLog(@"Company: %@", company);
  
}





