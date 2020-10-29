
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject<UIApplicationDelegate>

@property(strong, nonatomic) UIWindow* window;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
  printf("didFinishLaunchingWithOptions\n");
  
  // 1. 화면 해상도를 얻어온다.
  UIScreen* mainScreen = [UIScreen mainScreen];
  CGRect rect = [mainScreen bounds];
  printf("width=%lf height=%lf\n", rect.size.width, rect.size.height);
  
  // 2. UIWindow 객체를 생성한다.
  self.window = [[UIWindow alloc] initWithFrame:rect];
  _window.backgroundColor = [UIColor greenColor];
  
  
  // iOS 12 이후로는 아래 코드가 없으면 동작하지 않습니다.
  _window.rootViewController = [[UIViewController alloc] init];

  
  UIButton* button = [UIButton buttonWithType:UIButtonTypeInfoDark];
  CGRect rect2 = CGRectMake(10, 100, 100, 100);
  button.frame = rect2;
  
  [_window addSubview:button];
  
  
  
  // 3. Window 객체를 등록하고 화면에 뿌려준다.
  [_window makeKeyAndVisible];
  
  return TRUE;
}


// Step 1. Window 생성
// Application 구동이 완료된 후에 호출되는 함수
#if 0
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
  printf("didFinishLaunchingWithOptions\n");
  
  // 1. 화면 해상도를 얻어온다.
  UIScreen* mainScreen = [UIScreen mainScreen];
  CGRect rect = [mainScreen bounds];
  printf("width=%lf height=%lf\n", rect.size.width, rect.size.height);
  
  // 2. UIWindow 객체를 생성한다.
  self.window = [[UIWindow alloc] initWithFrame:rect];
  _window.backgroundColor = [UIColor greenColor];
  
  
  // iOS 12 이후로는 아래 코드가 없으면 동작하지 않습니다.
  _window.rootViewController = [[UIViewController alloc] init];
  
  
  // 3. Window 객체를 등록하고 화면에 뿌려준다.
  [_window makeKeyAndVisible];
  
  return TRUE;
}
#endif

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
  NSString* appDelegateClassName;
  
  @autoreleasepool {
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
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

// 3. AppDelegate의 didFinishLaunchingWithOptions가 호출되면, Window를 생성해야 합니다.
//      - iOS는 1개의 UIWindow를 가집니다.
//         : iOS 13 이후로는 여러개의 윈도우를 가질 수 있습니다.
//      - UIWindow를 생성하고 관리하는 책임 AppDelegate에 있습니다
