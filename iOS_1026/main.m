#import <Foundation/Foundation.h>

// Collection 열거하는 방법
// 1. for
// 2. NSEnumerator(Iterator) - '이론'
// 3. Fast Enumerator
//     - Collection이 Enumerator를 만족한다면, 사용할 수 있는 기능입니다.
// 4. Block

int main() {
  NSDictionary* dic = @{
    @"name": @"Tom",
    @"age": @42
  };
  
  // 1. Key 배열
  NSArray* keys = [dic allKeys];
  for (int i = 0 ; i < keys.count; ++i) {
    id key = keys[i];
    id obj = dic[key];
    NSLog(@"%@ -> %@", key, obj);
  }
  
  NSEnumerator* enumerator = [dic keyEnumerator];
  id key;
  while ((key = [enumerator nextObject]) != nil) {
    id obj = dic[key];
    NSLog(@"%@ -> %@", key, obj);
  }
  
  for (id key in dic) {
    id obj = dic[key];
    NSLog(@"%@ -> %@", key, obj);
  }
  
  // Block 버전을 찾아서 구현해보세요.
  [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
    NSLog(@"%@ -> %@", key, obj);
  }];
  
  
}





#if 0
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
    *stop = TRUE;
  }];
}
#endif
