
#import "ViewController.h"

@implementation ViewController


// UIPickerView (Delegate Pattern)
//
// NSArray* animals = @[ @"사자", @"코끼리", @"뱀", @"늑대" ];

//   UIPickerViewDataSource
//      위의 프로토콜을 통해 pickerView 원하는 데이터를 출력하는 것이 가능하다.

//   UIPickerViewDelegate
//      위의 프로토콜을 통해 pickerView 상태 변화에 대응할 수 있다.

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  self.animals = @[ @"사자", @"코끼리", @"뱀", @"늑대" ];
  self.fruits = @[ @"사과" , @"배", @"바나나" ];
  self.currentSelectedIndex = 0;
  
  _nameLabel.text = _animals[0];
  
   _pickerView.dataSource = self;
   _pickerView.delegate = self;
}

- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
  printf("segmentedValueChanged - %ld\n", sender.selectedSegmentIndex);
    
  _currentSelectedIndex = sender.selectedSegmentIndex;
  
  // 데이터의 크기나 내용이 변경되었을 때
  [_pickerView reloadAllComponents];
}





// returns the number of 'columns' to display.
// - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
// returns the # of rows in each component..
// - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  
  if (_currentSelectedIndex == 0)
    return _animals.count;
  else
    return _fruits.count;
}

#pragma mark - UIPickerViewDelegate
// UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  
  if (_currentSelectedIndex == 0)
    return _animals[row];
  else
    return _fruits[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  if (_currentSelectedIndex == 0)
    _nameLabel.text = _animals[row];
  else
    _nameLabel.text = _fruits[row];
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
//  return 64.0;
//}

@end
