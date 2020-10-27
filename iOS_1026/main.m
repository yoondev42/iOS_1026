#import <Foundation/Foundation.h>

// Collection 열거하는 방법
// 1. for
// 2. NSEnumerator(Iterator) - '이론'
// 3. Fast Enumerator
//     - Collection이 Enumerator를 만족한다면, 사용할 수 있는 기능입니다.
// 4. Block

int main() {
  // 1. for
  NSArray* arr = @[ @10, @20, @30 ];
  for (int i = 0 ; i < arr.count ; ++i) {
    NSLog(@"%@", arr[i]);
  }
  
  // 2. Enumerator - X
  NSEnumerator* enumerator = [arr objectEnumerator];
  id object;
  while ((object = [enumerator nextObject]) != nil) {
    NSLog(@"%@", object);
  }
  
  // 3. Fast Enumerator
  for (id object in arr) {
    NSLog(@"%@", object);
  }
  
  // 4. Block
  //  : _Nonnull, _Nullable - Swift에서 타입 추론을 위한 태그 정보
  [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
    NSLog(@"%lu - %@", idx, obj);
  }];
  
}
