
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

- (void)applicationDidEnterBackground:(UIApplication *)application {
  printf("applicationDidEnterBackground\n");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  printf("applicationWillEnterForeground\n");
}

@end




// AutoReleasePool이 한개 이상 제공되어야 합니다.

int main(int argc, char* argv[]) {
  printf("Hello, iOS\n");
  
  @autoreleasepool {
    NSString* appDelegateClassName = NSStringFromClass([AppDelegate class]);
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
  }
  
  // return UIApplicationMain(argc, argv, nil, @"AppDelegate");

  // Class c = NSClassFromString(@"AppDelegate")
  // id obj = [[c alloc] init];
  
}


// 1. iOS framework - Cocoa Touch Framework
//   => main 함수로 시작합니다.
// 2. App - UIApplication
//          1) UIApplication 객체 생성
//          2) AppDelegate 객체를 UIApplicetion 객체의 delegate로 연결
//   => UIApplicationMain
//          Info.plist를 기반으로 UIApplication객체를 생성하고,
//          사용자가 정의한 클래스의 객체를 생성하고, UIApplication객체의 delegate로 등록합니다.

