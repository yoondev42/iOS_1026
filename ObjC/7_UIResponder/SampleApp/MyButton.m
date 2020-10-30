

#import "MyButton.h"

// 초기화 메소드의 재정의가 필요합니다.
//  1) initWithFrame: 코드를 통해 생성될 때 사용하는 지정 초기화 메소드
//  2) initWithCoder: IB / Storyboard를 통해 생성될 때 사용되는 지정 초기화 메소드

@implementation MyButton


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("MyButton - touchesBegan\n");
  
  [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  printf("MyButton - touchesEnded\n");
  
  [super touchesEnded:touches withEvent:event];
}


- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self commonInit];
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self commonInit];
  }
  return self;
}

- (void)commonInit {
  // MyButton.xib를 로드해서, contentView로 초기화한다.
  NSBundle* bundle = [NSBundle bundleForClass:[MyButton class]];
  UINib* nib = [UINib nibWithNibName:@"MyButton" bundle:bundle];
  UIView* view = [nib instantiateWithOwner:self options:nil][0];
  
  view.frame = self.bounds;
  self.contentView = view;
  
  [self addSubview:_contentView];
}

@end
