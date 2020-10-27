
#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(strong, nonatomic) NSString* name;
@property(assign, nonatomic) int age;

- (id)initWithName:(NSString*)name age:(int)age;

@end

@implementation Person

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





