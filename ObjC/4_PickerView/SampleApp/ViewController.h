
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource>


@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) NSArray* animals;


@end

