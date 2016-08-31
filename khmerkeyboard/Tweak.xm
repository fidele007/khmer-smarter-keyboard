@interface KSKSettingsViewController : UIViewController //KhmerKeyboard.SettingViewController
@property (retain,nonatomic) NSUserDefaults * mySharedDefaults;
@property (assign,nonatomic) UISwitch * zeroSpaceSwitcha;
- (NSUserDefaults *)mySharedDefaults;
- (UISwitch *)zeroSpaceSwitcha;
@end

static UILabel *spaceCursorLabel;
static UISwitch *spaceCursorSwitch;

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
