#import <Foundation/Foundation.h>

// 클래스 기본 문법
// 1. ObjC는 smalltalk 언어의 영향을 받았습니다.
//   => 다른 객체 지향 언어와는 용어적인 차이가 있습니다.


#if 0
class Car {
  
};
#endif

// 클래스 선언부 - .h(헤더 파일)
@interface Car : NSObject {
  // 필드를 정의할 수 있습니다.
@public
  int speed;
@protected
  int color;
@private
  int n;
}

@end


// 클래스 정의부 - .m(소스 파일)
@implementation Car

@end

int main() {
  // Car* car = new Car;
  
  // Car의 클래스에 new라는 메세지를 전송하면, 새로운 객체를 생성할 수 있습니다.
  Car* car = [Car new];
  
  car->speed = 100;
  printf("%d\n", car->speed);
}
