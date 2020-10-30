
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>


@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) NSArray* animals;
@property (strong, nonatomic) NSArray* fruits;
@property (assign, nonatomic) int currentSelectedIndex;

@end

