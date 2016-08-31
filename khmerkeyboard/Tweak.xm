#include <libcolorpicker.h>

@interface KSKSettingsViewController : UIViewController //KhmerKeyboard.SettingViewController
@property (retain,nonatomic) NSUserDefaults * mySharedDefaults;
@property (assign,nonatomic) UISwitch * zeroSpaceSwitcha;
- (NSUserDefaults *)mySharedDefaults;
- (UISwitch *)zeroSpaceSwitcha;
@end

static UILabel *spaceCursorLabel;
static UISwitch *spaceCursorSwitch;
static UILabel *themeLabel;
static UISwitch *themeSwitch;
static UIButton *themeButton;

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

  // Add SpaceCusor option (label & switch)
  if (!CGRectIsEmpty(ZWSPLabelFrame)) {
    CGRect spaceCursorLabelFrame = ZWSPLabelFrame;
    spaceCursorLabelFrame.origin.y += CGRectGetHeight(ZWSPLabelFrame) + 10;
    spaceCursorLabelFrame.size.width += 30;
    if (spaceCursorLabel) {
      [spaceCursorLabel removeFromSuperview];
      [spaceCursorLabel autorelease];
    }
    spaceCursorLabel = [[UILabel alloc] initWithFrame:spaceCursorLabelFrame];
    spaceCursorLabel.text = @"ផ្លាស់ទី Cursor ដោយអូសប៊ូតុងដកឃ្លា";
    [[self view] addSubview:spaceCursorLabel];
  }

  // HBLogDebug(@"Switch frame: %@", NSStringFromCGRect([self zeroSpaceSwitcha].frame));
  CGRect spaceCursorSwitchFrame = [self zeroSpaceSwitcha].frame;
  spaceCursorSwitchFrame.origin.y += CGRectGetHeight(spaceCursorSwitchFrame) + 10;
  if (spaceCursorSwitch) {
    HBLogDebug(@"Removing switch: %@", spaceCursorSwitch);
    [spaceCursorSwitch removeFromSuperview];
    [spaceCursorSwitch autorelease];
  }
  spaceCursorSwitch = [[UISwitch alloc] initWithFrame:spaceCursorSwitchFrame];
  [[self view] addSubview:spaceCursorSwitch];
  BOOL isSpaceCursorEnabled = [[self mySharedDefaults] boolForKey:@"isSpaceCursorEnabled"];
  [spaceCursorSwitch setOn:isSpaceCursorEnabled];
  [spaceCursorSwitch addTarget:self
                        action:@selector(spaceCursorStateChanged:)
              forControlEvents:UIControlEventValueChanged];

  // Add theme option (label & switch)
  CGRect themeLabelFrame = spaceCursorLabel.frame;
  themeLabelFrame.origin.y += CGRectGetHeight(themeLabelFrame) + 10;
  if (themeLabel) {
    [themeLabel removeFromSuperview];
    [themeLabel autorelease];
  }
  themeLabel = [[UILabel alloc] initWithFrame:themeLabelFrame];
  themeLabel.text = @"ប្រើ​ពណ៌​សម្រាប់​ក្ដារ​ចុច";
  [[self view] addSubview:themeLabel];

  CGRect themeSwitchFrame = spaceCursorSwitchFrame;
  themeSwitchFrame.origin.y += CGRectGetHeight(themeSwitchFrame) + 10;
  if (themeSwitch) {
    [themeSwitch removeFromSuperview];
    [themeSwitch autorelease];
  }
  themeSwitch = [[UISwitch alloc] initWithFrame:themeSwitchFrame];
  [[self view] addSubview:themeSwitch];
  BOOL isThemeEnabled = [[self mySharedDefaults] boolForKey:@"isThemeEnabled"];
  [themeSwitch setOn:isThemeEnabled];
  [themeSwitch addTarget:self
                  action:@selector(themeSwitchStateChanged:)
        forControlEvents:UIControlEventValueChanged];

  // Theme button for choosing keyboard's background color
  if (themeButton) {
    [themeButton removeFromSuperview];
  }
  themeButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [themeButton setTitle:@"ជ្រើសរើស​ពណ៌​ក្ដារចុច" forState:UIControlStateNormal];
  CGRect themeButtonFrame = themeLabelFrame;
  themeButtonFrame.origin.x += 20;
  themeButtonFrame.origin.y += CGRectGetHeight(themeButtonFrame) + 5;
  themeButton.frame = themeButtonFrame;
  [themeButton sizeToFit];
  [[self view] addSubview:themeButton];

  [themeButton addTarget:self action:@selector(themeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
  %orig;

  // Set initial state of ZWSP switch according to its preferences
  BOOL isZWSPEnabled = [[self mySharedDefaults] boolForKey:@"isZWSPEnabled"];
  HBLogDebug(@"isZWSPEnabled: %d", isZWSPEnabled);
  [[self zeroSpaceSwitcha] setOn:isZWSPEnabled];
}

- (void)setZeroSpaceSwitcha:(UISwitch *)zeroSpaceSwitch {
  %orig;
  [zeroSpaceSwitch addTarget:self
                      action:@selector(zeroSpaceStateChanged:)
            forControlEvents:UIControlEventValueChanged];
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
%end

%ctor {
  %init(KSKSettingsViewController = objc_getClass("KhmerKeyboard.SettingViewController"));
}
