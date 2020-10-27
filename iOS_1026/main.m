
#import <Foundation/Foundation.h>

// KVO
//  - Key-Value Observing
//    : 특정한 프로퍼티의 값이 실행시간에 변경되는 것을 감지하는 기술

// TextView nameTextView;
// String name;
// - name의 값이 변경되면, nameTextView의 text도 변경되어야 한다.

@interface Person : NSObject
@property(strong, nonatomic) NSString* name;
@end

@implementation Person
@end

@interface UILabel : NSObject
@property(strong, nonatomic) NSString* text;
@end

@implementation UILabel

// Person의 name 프로퍼티의 값이 변경될 때마다 아래의 메소드가 자동으로 호출된다.
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
  
  id old = change[NSKeyValueChangeOldKey];
  id new = change[NSKeyValueChangeNewKey];
  
  NSLog(@"%@ -> %@", old, new);
  self.text = new;
}

@end


// Person의 name이 변경될 때마다, 자동적으로 UILabel의 text가 변경되어야 한다.
int main() {
  Person* person = [Person new];
  UILabel* label = [UILabel new];
  
  // Observer 등록 - Key(프로퍼티)
  [person addObserver:label
           forKeyPath:@"name"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:nil];
  
  person.name = @"Tom";
  
  [person removeObserver:label forKeyPath:@"name"];
  
  person.name = @"Bob";
  
}
