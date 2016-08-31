@interface KSKSettingsViewController : UIViewController
@property (retain,nonatomic) NSUserDefaults * mySharedDefaults;
@property (assign,nonatomic) UISwitch * zeroSpaceSwitcha;
- (NSUserDefaults *)mySharedDefaults;
- (UISwitch *)zeroSpaceSwitcha;
@end

%hook KSKSettingsViewController
- (void)viewDidLoad {
  %orig;
  // TODO: Add other options here
  BOOL isZWSPEnabled = [[self mySharedDefaults] boolForKey:@"isZWSPEnabled"];
  HBLogDebug(@"isZWSPEnabled: %d", isZWSPEnabled);
  [[self zeroSpaceSwitcha] setOn:isZWSPEnabled];
}

- (void)setZeroSpaceSwitcha:(UISwitch *)zeroSpaceSwitch {
  %orig;
  [zeroSpaceSwitch addTarget:self action:@selector(zeroSpaceStateChanged:) forControlEvents:UIControlEventValueChanged];
}

%new
- (void)zeroSpaceStateChanged:(UISwitch *)zeroSpaceSwitch {
  HBLogDebug(@"Setting ZWSP to %d", zeroSpaceSwitch.on);
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:zeroSpaceSwitch.on] forKey:@"isZWSPEnabled"];
}
%end

%ctor {
  %init(KSKSettingsViewController = objc_getClass("KhmerKeyboard.SettingViewController"));
}