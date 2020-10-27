// Delegate

#import <Foundation/Foundation.h>

// Cocoa Design Pattern
// 1. Target-Action Pattern
// 2. Delegate Pattern
//   => Interface 기반의 이벤트 처리 설계

#if 0
interface CLLocationManagerListener {
  void updateLocation(int x, int y);
  void failToLocation();
}
#endif
// CLLocationManager의 상태 변화에 대한 메소드를 "프로토콜(=인터페이스)"로 약속하자.
@protocol CLLocationManagerDelegate<NSObject>
@required
- (void)updateLocationWithX:(int)x withY:(int)y;
@optional
- (void)failToLocation;
@end

// CLLocationManager
//  : 위치 정보를 얻는 클래스
@interface CLLocationManager : NSObject

@property(weak, nonatomic) id<CLLocationManagerDelegate> delegate;

- (void)startUpdateLocation;
@end

@implementation CLLocationManager

- (void)startUpdateLocation {
  // 위치가 업데이트가 되었다.
  [_delegate updateLocationWithX:10 withY:20];
  
  // 위치 정보를 얻는데 실패하였다.
  if ([_delegate respondsToSelector:@selector(failToLocation)]) {
    [_delegate failToLocation];
  }
  
  // failToLocation을 구현하지 않아도, 정상 동작 할 수 있도록 구현해주어야 한다.
}

@end

#if 0
class Navigation extends NSObject implements CLLocationManagerDelegate {
  
}

#endif


// Navigation
@interface Navigation : NSObject<CLLocationManagerDelegate>
@end
@implementation Navigation

//- (void)failToLocation {
//  printf("Navigation - 위치 정보를 얻는데 실패하였습니다.\n");
//}

- (void)updateLocationWithX:(int)x withY:(int)y {
  printf("Navigation Update - (%d, %d)\n", x, y);
}

@end

// 확인해야 하는 것
// 1. delegate를 지정하지 않았을 때
//    - 'nil' 객체를 대상으로 메소드를 호출할 때 아무 동작도 수행하지 않는다.

// 2. Navigation이 Protocol을 만족하지 않을 때
//   - id<CLLocationManagerDelegate> delegate;

// 3. @property(strong, nonatomic) id<CLLocationManagerDelegate> delegate;
//   - strong을 지정하면 안됩니다.
//     이벤트 핸들러에 의해 객체가 파괴되지 않을 수 있습니다.

// 4. Objective-C protocol
//    @required - 반드시 구현해야 한다.
//    @optional - 구현하지 않아도 된다.

int main() {
  CLLocationManager* manager = [[CLLocationManager alloc] init];
  Navigation* navi = [[Navigation alloc] init];
  
  manager.delegate = navi;
  // navi = nil;
  
  [manager startUpdateLocation];
}
