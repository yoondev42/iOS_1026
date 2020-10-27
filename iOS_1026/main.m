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
@protocol CLLocationManagerDelegate
- (void)updateLocationWithX:(int)x withY:(int)y;
- (void)failToLocation;
@end

// CLLocationManager
//  : 위치 정보를 얻는 클래스
@interface CLLocationManager : NSObject

@property(strong, nonatomic) id delegate;

- (void)startUpdateLocation;
@end

@implementation CLLocationManager

- (void)startUpdateLocation {
  // 위치가 업데이트가 되었다.
  [_delegate updateLocationWithX:10 withY:20];
  
  // 위치 정보를 얻는데 실패하였다.
  [_delegate failToLocation];
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

- (void)failToLocation {
  printf("Navigation - 위치 정보를 얻는데 실패하였습니다.\n");
}

- (void)updateLocationWithX:(int)x withY:(int)y {
  printf("Navigation Update - (%d, %d)\n", x, y);
}

@end

int main() {
  CLLocationManager* manager = [[CLLocationManager alloc] init];
  Navigation* navi = [[Navigation alloc] init];
  
  manager.delegate = navi;  // !!!
  
  [manager startUpdateLocation];
}
