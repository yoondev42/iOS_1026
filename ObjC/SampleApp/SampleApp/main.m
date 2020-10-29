
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject<UIApplicationDelegate>

// Application 구동이 완료된 후에 호출되는 함수


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
  printf("didFinishLaunchingWithOptions\n");
  
  return TRUE;
}

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

