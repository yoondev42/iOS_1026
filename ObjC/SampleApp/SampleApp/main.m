
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject<UIApplicationDelegate>
@end

@implementation AppDelegate
@end




int main(int argc, char* argv[]) {
  printf("Hello, iOS\n");
  return UIApplicationMain(argc, argv, nil, @"AppDelegate");
}


// 1. iOS framework - Cocoa Touch Framework
//   => main 함수로 시작합니다.
// 2. App - UIApplication
//          1) UIApplication 객체 생성
//          2) AppDelegate 객체를 UIApplicetion 객체의 delegate로 연결
//   => UIApplicationMain

