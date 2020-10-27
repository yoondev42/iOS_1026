
#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong, nonatomic) NSString* firstName;
@property(strong, nonatomic) NSString* lastName;

@property(strong, nonatomic) NSString* fullName;   // Backing field가 없는 property

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;

- (NSString*)fullName;
- (void)setFullName:(NSString*)fullName;

@end

@implementation User

- (void)setFullName:(NSString *)fullName {
  NSArray* arr = [fullName componentsSeparatedByString:@" "];
  self.firstName = [arr objectAtIndex:0];
  self.lastName = [arr objectAtIndex:1];
}

- (NSString *)fullName {
  return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName {
  self = [super init];
  if (self) {
    _firstName = firstName;
    _lastName = lastName;
  }
  return self;
}
@end

int main() {
  User* user = [[User alloc] initWithFirstName:@"Gildong" lastName:@"Hong"];
  
  NSLog(@"%@", [user fullName]);
  
  user.fullName = @"Soonshin Lee"; // [user setFullName:@"Soonshin Lee"];
  NSLog(@"%@", user.fullName);

}
