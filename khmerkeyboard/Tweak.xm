#include <libcolorpicker.h>

@interface KSKSettingsViewController : UIViewController //KhmerKeyboard.SettingViewController
@property (retain,nonatomic) NSUserDefaults * mySharedDefaults;
@property (assign,nonatomic) UISwitch * zeroSpaceSwitcha;
- (NSUserDefaults *)mySharedDefaults;
- (UISwitch *)zeroSpaceSwitcha;
// New methods
- (void)animateView:(UIView *)view withAlpha:(CGFloat)alpha duration:(CGFloat)duration;
@end

static UILabel *spaceCursorLabel;
static UISwitch *spaceCursorSwitch;
static UILabel *themeLabel;
static UISwitch *themeSwitch;
static UIButton *themeButton;
static UIButton *charThemeButton;

%hook KSKSettingsViewController //KhmerKeyboard.SettingViewController
- (void)viewDidLayoutSubviews {
  %orig;

  // Get ZWSPLabel's frame to calculate the next subviews below
  CGRect ZWSPLabelFrame;
  for (UILabel *label in [[self view] subviews]) {
    if (![label respondsToSelector:@selector(text)]) {
      continue;
    } else if ([label.text isEqualToString:@"ប្រើចន្លេាះមិនឃេីញ"]) {
      ZWSPLabelFrame = label.frame;
    }
  }

  // Update |spaceCursorLabel| frame with orientation
  if (!CGRectIsEmpty(ZWSPLabelFrame)) {
    CGRect spaceCursorLabelFrame = ZWSPLabelFrame;
    spaceCursorLabelFrame.origin.y += CGRectGetHeight(ZWSPLabelFrame) + 10;
    spaceCursorLabelFrame.size.width += 30;
    spaceCursorLabel.frame = spaceCursorLabelFrame;
  }

  // Update |spaceCursorSwitch| frame with orientation
  CGRect spaceCursorSwitchFrame = [self zeroSpaceSwitcha].frame;
  spaceCursorSwitchFrame.origin.y += CGRectGetHeight(spaceCursorSwitchFrame) + 10;
  spaceCursorSwitch.frame = spaceCursorSwitchFrame;

  // Update |themeLabel| frame with orientation
  CGRect themeLabelFrame = spaceCursorLabel.frame;
  themeLabelFrame.origin.y += CGRectGetHeight(themeLabelFrame) + 10;
  themeLabel.frame = themeLabelFrame;

  // Update |themeSwitch| frame with orientation
  CGRect themeSwitchFrame = spaceCursorSwitchFrame;
  themeSwitchFrame.origin.y += CGRectGetHeight(themeSwitchFrame) + 10;
  themeSwitch.frame = themeSwitchFrame;

  // Update |themeButton| frame with orientation
  CGRect themeButtonFrame = themeLabelFrame;
  themeButtonFrame.origin.x += 20;
  themeButtonFrame.origin.y += CGRectGetHeight(themeButtonFrame) + 5;
  themeButton.frame = themeButtonFrame;
  [themeButton sizeToFit];

  // Update |charThemeButton| frame with orientation
  CGRect charThemeButtonFrame = themeButtonFrame;
  charThemeButtonFrame.origin.y += CGRectGetHeight(charThemeButtonFrame);
  charThemeButton.frame = charThemeButtonFrame;
  [charThemeButton sizeToFit];
}

- (void)viewDidLoad {
  %orig;

  // Set initial state of ZWSP switch according to its preferences
  BOOL isZWSPEnabled = [[self mySharedDefaults] boolForKey:@"isZWSPEnabled"];
  HBLogDebug(@"isZWSPEnabled: %d", isZWSPEnabled);
  [[self zeroSpaceSwitcha] setOn:isZWSPEnabled];

  // Create |spaceCursorLabel|
  spaceCursorLabel = [[[UILabel alloc] init] autorelease];
  spaceCursorLabel.text = @"ផ្លាស់ទី Cursor ដោយអូសប៊ូតុងដកឃ្លា";
  [[self view] addSubview:spaceCursorLabel];

  // Create |spaceCursorSwitch|
  spaceCursorSwitch = [[[UISwitch alloc] init] autorelease];
  BOOL isSpaceCursorEnabled = [[self mySharedDefaults] boolForKey:@"isSpaceCursorEnabled"];
  [spaceCursorSwitch setOn:isSpaceCursorEnabled];
  [spaceCursorSwitch addTarget:self
                        action:@selector(spaceCursorStateChanged:)
              forControlEvents:UIControlEventValueChanged];
  [[self view] addSubview:spaceCursorSwitch];

  // Create |themeLabel|
  themeLabel = [[[UILabel alloc] init] autorelease];
  themeLabel.text = @"ប្រើ​ពណ៌​សម្រាប់​ក្ដារ​ចុច";
  [[self view] addSubview:themeLabel];

  // Create |themeSwitch|
  themeSwitch = [[[UISwitch alloc] init] autorelease];
  BOOL isThemeEnabled = [[self mySharedDefaults] boolForKey:@"isThemeEnabled"];
  [themeSwitch setOn:isThemeEnabled];
  [themeSwitch addTarget:self
                  action:@selector(themeSwitchStateChanged:)
        forControlEvents:UIControlEventValueChanged];
  [[self view] addSubview:themeSwitch];

  // Theme button for choosing keyboard's background color
  /* UIButton created with  +buttonWithType: returns an autorelease object, so there is no need
     to explicitly release it */
  themeButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [themeButton setTitle:@"ជ្រើសរើស​ពណ៌​ក្ដារចុច" forState:UIControlStateNormal];
  [themeButton addTarget:self
                  action:@selector(themeButtonPressed:)
        forControlEvents:UIControlEventTouchUpInside];
  [[self view] addSubview:themeButton];

  charThemeButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [charThemeButton setTitle:@"ជ្រើស​រើស​ពណ៌​អក្សរ" forState:UIControlStateNormal];
  [charThemeButton addTarget:self
                      action:@selector(charThemeButtonPressed:)
            forControlEvents:UIControlEventTouchUpInside];
  [[self view] addSubview:charThemeButton];

  if (!isThemeEnabled) {
    themeButton.alpha = 0;
    charThemeButton.alpha = 0;
  }
}

- (void)setZeroSpaceSwitcha:(UISwitch *)zeroSpaceSwitch {
  %orig;
  [zeroSpaceSwitch addTarget:self
                      action:@selector(zeroSpaceStateChanged:)
            forControlEvents:UIControlEventValueChanged];
}

%new
- (void)charThemeButtonPressed:(UIButton *)sender {
  NSString *selectedColor = [[self mySharedDefaults] objectForKey:@"keyboardForegroundColor"];
  UIColor *startColor = LCPParseColorString(selectedColor, @"#FFFFFF");
  PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];
  [alert displayWithCompletion:
      ^void(UIColor *pickedColor) {
        NSString *hexString = [UIColor hexFromColor:pickedColor];
        hexString = [hexString stringByAppendingFormat:@":%f", pickedColor.alpha];
        [[self mySharedDefaults] setObject:hexString
                              forKey:@"keyboardForegroundColor"];
      }];
}

%new
- (void)themeButtonPressed:(UIButton *)sender {
  NSString *selectedColor = [[self mySharedDefaults] objectForKey:@"keyboardBackgroundColor"];
  UIColor *startColor = LCPParseColorString(selectedColor, @"#1E4679");
  PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];
  [alert displayWithCompletion:
      ^void(UIColor *pickedColor) {
        NSString *hexString = [UIColor hexFromColor:pickedColor];
        hexString = [hexString stringByAppendingFormat:@":%f", pickedColor.alpha];
        [[self mySharedDefaults] setObject:hexString
                              forKey:@"keyboardBackgroundColor"];
      }];
}

%new
- (void)themeSwitchStateChanged:(UISwitch *)themeSwitch {
  HBLogDebug(@"Setting ThemeOption to %d", themeSwitch.on);
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:themeSwitch.on]
                              forKey:@"isThemeEnabled"];
  if (themeSwitch.on) {
    [self animateView:themeButton withAlpha:1.0 duration:0.5];
    [self animateView:charThemeButton withAlpha:1.0 duration:0.5];
  } else {
    [self animateView:themeButton withAlpha:0 duration:0.5];
    [self animateView:charThemeButton withAlpha:0 duration:0.5];
  }
}

%new
- (void)zeroSpaceStateChanged:(UISwitch *)zeroSpaceSwitch {
  HBLogDebug(@"Setting ZWSP to %d", zeroSpaceSwitch.on);
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:zeroSpaceSwitch.on]
                              forKey:@"isZWSPEnabled"];
}

%new
- (void)spaceCursorStateChanged:(UISwitch *)spaceCursorSwitch {
  HBLogDebug(@"Setting SpaceCursor to %d", spaceCursorSwitch.on);
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:spaceCursorSwitch.on]
                              forKey:@"isSpaceCursorEnabled"];
}

%new
- (void)animateView:(UIView *)view withAlpha:(CGFloat)alpha duration:(CGFloat)duration {
  [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationCurveEaseOut
        animations:^{
          view.alpha = alpha;
        }
        completion:nil
    ];
}
%end

%ctor {
  %init(KSKSettingsViewController = objc_getClass("KhmerKeyboard.SettingViewController"));
}
