
#import <Foundation/Foundation.h>

// void f(int a, int b)
//    C: void (^f)(int a, int b)
// ObjC: (void (^)(int a, int b))f

@interface Car : NSObject

- (void)go:(int)a block:(void (^)(int a, int b))block;

@end

@implementation Car

- (void)go:(int)a block:(void (^)(int a, int b))block {
  printf("go - %d\n", a);
  block(10, 20);
}

@end

int main() {
  Car* car = [[Car alloc] init];
  
  [car go:42 block:^(int a, int b) {
    printf("block: %d, %d\n", a, b);
  }];
}
