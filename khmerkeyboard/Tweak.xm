#import <libcolorpicker.h>
#import <KSKImageCropper.h>

@interface KSKSettingsViewController : UIViewController //KhmerKeyboard.SettingViewController
@property (retain,nonatomic) NSUserDefaults * mySharedDefaults;
@property (assign,nonatomic) UISwitch * zeroSpaceSwitcha;
- (NSUserDefaults *)mySharedDefaults;
- (UISwitch *)zeroSpaceSwitcha;
// New methods
- (void)animateView:(UIView *)view withAlpha:(CGFloat)alpha duration:(CGFloat)duration;
@end

@interface PLCropOverlayCropView : UIView {
  CGRect _cropRect;
}
- (CGRect)cropRect;
- (void)setCropRect:(CGRect)arg1 ;
- (void)drawRect:(CGRect)arg1 ;
- (void)setFrame:(CGRect)arg1 ;
@end

@interface PLCropOverlay : UIView {
  PLCropOverlayCropView* _cropView;
}
- (CGRect)cropRect;
- (void)_updateCropRectInRect:(CGRect)arg1 ;
- (void)setOKButtonTitle:(id)arg1 ;
- (void)setCancelButtonTitle:(id)arg1 ;
@end

@interface PLPhotoTileViewController : UIViewController
- (id)expandableImageView;
- (UIScrollView *)scrollView;
@end

@interface PUUIImageViewController : UIViewController {
  PLPhotoTileViewController* _imageTile;
}
- (id)initWithUIImage:(id)arg1 cropRect:(CGRect)arg2 ;
- (PLCropOverlay *)cropOverlay;
@end


static UILabel *spaceCursorLabel;
static UISwitch *spaceCursorSwitch;
static UILabel *themeLabel;
static UISegmentedControl *themeOption;
static UIButton *themeButton;
static UIButton *charThemeButton;

static UIImagePickerController *ipc;
static UIPopoverController *popover;
static UIButton *photoPickerButton;

// static KSKImageCropper *imageCropper;

%hook KSKSettingsViewController //KhmerKeyboard.SettingViewController
- (void)viewDidLayoutSubviews {
  %orig;

  CGFloat superviewWidth = CGRectGetWidth([self view].frame);

  // Update |spaceCursorSwitch| frame with orientation
  CGRect spaceCursorSwitchFrame = [self zeroSpaceSwitcha].frame;
  spaceCursorSwitchFrame.origin.y += CGRectGetHeight(spaceCursorSwitchFrame) + 10;
  spaceCursorSwitch.frame = spaceCursorSwitchFrame;

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
    spaceCursorLabel.frame = ZWSPLabelFrame;
    [spaceCursorLabel sizeToFit];
    spaceCursorLabel.center = CGPointMake(spaceCursorLabel.center.x, spaceCursorSwitch.center.y);
  }

  // Update |themeLabel| frame with orientation
  CGRect themeLabelFrame = spaceCursorLabel.frame;
  themeLabelFrame.origin.y += CGRectGetHeight(themeLabelFrame) + 20;
  themeLabel.frame = themeLabelFrame;
  [themeLabel sizeToFit];
  themeLabel.center = CGPointMake(superviewWidth/2.0, themeLabel.center.y);

  // Update |themeOption| frame with orientation
  CGRect themeOptionFrame = spaceCursorLabel.frame;
  themeOptionFrame.origin.y += CGRectGetHeight(themeOptionFrame) + 50;
  themeOptionFrame.size.width = superviewWidth/1.2;
  themeOptionFrame.size.height *= 1.7;
  themeOption.frame = themeOptionFrame;
  themeOption.center = CGPointMake(superviewWidth/2.0, themeOption.center.y);

  // Update |charThemeButton| frame with orientation
  CGRect charThemeButtonFrame = themeOptionFrame;
  charThemeButtonFrame.origin.y += CGRectGetHeight(charThemeButtonFrame) + 15;
  charThemeButton.frame = charThemeButtonFrame;
  [charThemeButton sizeToFit];
  charThemeButton.center = CGPointMake(superviewWidth/2.0, charThemeButton.center.y);

  // Update |themeButton| frame with orientation
  CGRect themeButtonFrame = charThemeButtonFrame;
  themeButtonFrame.origin.y += CGRectGetHeight(themeButtonFrame) + 5;
  themeButton.frame = themeButtonFrame;
  [themeButton sizeToFit];
  themeButton.center = CGPointMake(superviewWidth/2.0, themeButton.center.y);

  // Update |photoPickerButton| frame with orientation
  photoPickerButton.frame = themeButtonFrame;
  [photoPickerButton sizeToFit];
  photoPickerButton.center = CGPointMake(superviewWidth/2.0, photoPickerButton.center.y);
}

- (void)viewDidLoad {
  %orig;

  // Set initial state of ZWSP switch according to its preferences
  BOOL isZWSPEnabled = [[self mySharedDefaults] boolForKey:@"isZWSPEnabled"];
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

  themeLabel = [[[UILabel alloc] init] autorelease];
  themeLabel.text = @"--Theme--";
  [[self view] addSubview:themeLabel];

  // Create theme segemented control
  NSArray *themeArray = @[@"ទេ", @"ពណ៌", @"រូបភាព"];
  themeOption = [[[UISegmentedControl alloc] initWithItems:themeArray] autorelease];
  [themeOption addTarget:self
                  action:@selector(themeOptionChanged:)
        forControlEvents:UIControlEventValueChanged];
  themeOption.selectedSegmentIndex = [[self mySharedDefaults] integerForKey:@"KSKSelectedThemeOption"] ?: 0;
  [[self view] addSubview:themeOption];

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

  // Photo picker button
  photoPickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [photoPickerButton setTitle:@"ជ្រើស​រើស​រូប​ផៃ្ទខាង​ក្រោយ" forState:UIControlStateNormal];
  [photoPickerButton addTarget:self
                        action:@selector(photoPickerButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
  [[self view] addSubview:photoPickerButton];

  NSInteger themeOption = [[self mySharedDefaults] integerForKey:@"KSKSelectedThemeOption"];
  if (themeOption == 0) {
    themeButton.hidden = YES;
    photoPickerButton.hidden = YES;
    charThemeButton.hidden = YES;
  } else if (themeOption == 1) {
    photoPickerButton.hidden = YES;
  } else if (themeOption == 2) {
    themeButton.hidden = YES;
  }
}

- (void)setZeroSpaceSwitcha:(UISwitch *)zeroSpaceSwitch {
  %orig;
  [zeroSpaceSwitch addTarget:self
                      action:@selector(zeroSpaceStateChanged:)
            forControlEvents:UIControlEventValueChanged];
}

%new
- (void)themeOptionChanged:(UISegmentedControl *)control {
  [[self mySharedDefaults] setInteger:control.selectedSegmentIndex forKey:@"KSKSelectedThemeOption"];
  switch(control.selectedSegmentIndex) {
    case 0:
      themeButton.hidden = YES;
      photoPickerButton.hidden = YES;
      charThemeButton.hidden = YES;
      break;
    case 1:
      themeButton.hidden = NO;
      photoPickerButton.hidden = YES;
      charThemeButton.hidden = NO;
      break;
    case 2:
      themeButton.hidden = YES;
      photoPickerButton.hidden = NO;
      charThemeButton.hidden = NO;
      break;
  }
}

%new
- (void)imagePickerController:(UIImagePickerController *)picker
      didFinishPickingMediaWithInfo:(NSDictionary *)info {

  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    [ipc dismissViewControllerAnimated:NO completion:nil];
  } else {
    [popover dismissPopoverAnimated:NO];
  }
  UIImage *pickedImage = [info objectForKey:UIImagePickerControllerEditedImage];
  NSData *imageData = UIImageJPEGRepresentation(pickedImage, 0.9f);
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths firstObject];
  NSString *fileName = [NSString stringWithFormat:@"%@/keyboardBackgroundImage.jpg", documentsDirectory];
  [imageData writeToFile:fileName atomically:YES];
  [[self mySharedDefaults] setObject:fileName forKey:@"KSKBackgroundImage"];
  [[self mySharedDefaults] synchronize];

  // UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
  // imageCropper = [[[KSKImageCropper alloc] initWithImage:pickedImage] autorelease];
  // imageCropper.delegate = self;
  // [picker presentViewController:imageCropper animated:YES completion:nil];
}

// %new
// - (void)imageCropper:(KSKImageCropper *)cropper didFinishCroppingImageWithResult:(UIImage *)image {
//   [cropper dismissViewControllerAnimated:YES completion:nil];
//   if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
//     [ipc dismissViewControllerAnimated:NO completion:nil];
//   } else {
//     [popover dismissPopoverAnimated:NO];
//   }

//   // Show cropped image result
//   UIImageView *croppedImageView = [[[UIImageView alloc] initWithImage:image] autorelease];
//   CGFloat imageWidth = 300;
//   CGFloat imageHeight = image.size.height * imageWidth/image.size.width;
//   croppedImageView.frame = CGRectMake(0, 380, imageWidth, imageHeight);
//   croppedImageView.center = CGPointMake([self view].center.x, croppedImageView.center.y);
//   [[self view] addSubview:croppedImageView];
// }

%new
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [picker dismissViewControllerAnimated:YES completion:nil];
}

%new
- (void)photoPickerButtonPressed:(UIButton *)sender {
  ipc = [[[UIImagePickerController alloc] init] autorelease];
  ipc.delegate = self;
  ipc.allowsEditing = YES;
  ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    [self presentViewController:ipc animated:YES completion:nil];
  } else {
    popover = [[[UIPopoverController alloc] initWithContentViewController:ipc] autorelease];
    [popover presentPopoverFromRect:sender.frame
                             inView:[self view]
           permittedArrowDirections:UIPopoverArrowDirectionAny
                           animated:YES];
  }
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
        [[self mySharedDefaults] synchronize];
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
        [[self mySharedDefaults] synchronize];
      }];
}

%new
- (void)zeroSpaceStateChanged:(UISwitch *)zeroSpaceSwitch {
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:zeroSpaceSwitch.on]
                              forKey:@"isZWSPEnabled"];
  [[self mySharedDefaults] synchronize];
}

%new
- (void)spaceCursorStateChanged:(UISwitch *)spaceCursorSwitch {
  [[self mySharedDefaults] setObject:[NSNumber numberWithBool:spaceCursorSwitch.on]
                              forKey:@"isSpaceCursorEnabled"];
  [[self mySharedDefaults] synchronize];
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

@interface KSKELViewController : UIViewController
- (UILabel *)settinglabel;
- (UIButton *)settingbutton;
@end

%group KSKv212
%hook KSKELViewController // KhmerKeyboard.ELViewController
- (void)viewDidLoad {
  %orig;

  if ([self respondsToSelector:@selector(settinglabel)]) {
    [self settinglabel].hidden = NO;
  }
  
  if ([self respondsToSelector:@selector(settingbutton)]) {
    [self settingbutton].hidden = NO;
    [self settingbutton].userInteractionEnabled = YES;
  }
}
%end
%end

%hook UIImagePickerController
- (void)_layoutViewController:(UIViewController *)viewController {
  %orig;
  if ([viewController isKindOfClass:%c(PUUIImageViewController)]) {
    PUUIImageViewController *imgViewController = (PUUIImageViewController *)viewController;
    PLCropOverlay *cropOverlay = [imgViewController cropOverlay];
    PLCropOverlayCropView *cropOverlayView = MSHookIvar<PLCropOverlayCropView *>(cropOverlay, "_cropView");

    CGFloat keyboardRatio = 250.0/375.0;
    CGRect newCropRect = MSHookIvar<CGRect>(cropOverlay, "_cropRect");
    CGFloat newHeight = CGRectGetWidth(newCropRect) * keyboardRatio;
    CGFloat heightDifference = newCropRect.size.height - newHeight;
    newCropRect.size.height = newHeight;
    newCropRect.origin.y += heightDifference/2.0;

    // Change crop rect
    MSHookIvar<CGRect>(cropOverlay, "_cropRect") = newCropRect;

    // Change crop rect view
    [cropOverlayView setCropRect:newCropRect];

    // Adjust content inset of UIScrollView to enable more image scrolling
    CGFloat topPadding = CGRectGetMinY(newCropRect);
    CGFloat bottomPadding = CGRectGetHeight(imgViewController.view.frame) - CGRectGetMinY(newCropRect) - CGRectGetHeight(newCropRect);;
    PLPhotoTileViewController *photoViewController = MSHookIvar<PLPhotoTileViewController *>(imgViewController, "_imageTile");
    [photoViewController scrollView].contentInset = UIEdgeInsetsMake(topPadding, 0, bottomPadding, 0);

    // Change OK and Cancel button titles
    [cropOverlay setOKButtonTitle:@"រក្សាទុក"];
    [cropOverlay setCancelButtonTitle:@"បោះបង់"];
  }
}
%end

%ctor {
  NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  NSString *newVersion = @"2.1.2";

  if ([currentVersion compare:newVersion options:NSNumericSearch] == NSOrderedAscending) {
    // currentVersion < newVersion
  } else {
    // currentVersion >= newVersion
    %init(KSKv212, KSKELViewController = objc_getClass("KhmerKeyboard.ELViewController"));
  }

  %init(KSKSettingsViewController = objc_getClass("KhmerKeyboard.SettingViewController"));
}
