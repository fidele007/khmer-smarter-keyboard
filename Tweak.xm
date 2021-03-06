#import <libcolorpicker.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SSZipArchive/SSZipArchive.h"

@interface UIView (KhmerSmarterKeyboard)
// com_vanna_KhmerKeyboard_Keyboard.LightBox
@property (retain,nonatomic) UIView *currentView; // com_vanna_KhmerKeyboard_Keyboard.AdsAndPredictionView

// com_vanna_KhmerKeyboard_Keyboard.AdsAndPredictionView
- (UIScrollView *)predictionView;

// com_vanna_KhmerKeyboard_Keyboard.KeyButton
- (void)setTitleColor:(id)arg1 forState:(unsigned long long)arg2 ;

// com_vanna_KhmerKeyboard_Keyboard.SpaceButton
- (UILabel *)leftLabel;
- (UILabel *)centerLabel;
- (UILabel *)rightLabel;

// com_vanna_KhmerKeyboard_Keyboard.CharacterButtonsContainer
- (NSArray *)characterButtons;
@end

@interface UIButton (KhmerSmarterKeyboard)
- (void)setTextColor:(UIColor *)arg1 ;
@end

@interface KSKControlButton : UIButton
@end

@interface KSKSpaceButton : UIButton // com_vanna_KhmerKeyboard_Keyboard.SpaceButton
@property (retain,nonatomic) UILabel *centerLabel;
@property (retain,nonatomic) UILabel * leftLabel;
@property (retain,nonatomic) UILabel *rightLabel;
@property (copy,nonatomic) NSString *leftCharacter;
@property (copy,nonatomic) NSString *rightCharacter;
- (void)animateWayUp:(id)arg1;
@end

@interface KSKKeyboardView : UIView // com_vanna_KhmerKeyboard_Keyboard.KeyboardView
@property (retain,nonatomic) KSKSpaceButton *spaceButton;
- (void)setSpaceButton:(KSKSpaceButton *)spaceButton;
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
- (UIButton *)clickToDownloadView;
- (UIViewController *)keyboardViewcontroller;
- (UIView *)adsAndPredictionView;
- (void)initializeKeyboard;
// New methods
- (void)updatePredictionBar;
- (BOOL)downloadDictDatabase:(NSString *)databaseURL outputFile:(NSString *)outputFile error:(NSError **)error;
@end

@interface KSKKeyboardViewController : UIInputViewController <NSURLConnectionDelegate> // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
@property (assign,nonatomic) BOOL useZeroSpace;
@property (retain,nonatomic) KSKKeyboardView *keyboardView;
@property (retain,nonatomic) NSUserDefaults *sharedDefaults;
- (NSUserDefaults *)sharedDefaults;
- (void)setUseZeroSpace:(BOOL)arg1; // v2.1.1 and down
- (void)setIsZeroSpace:(BOOL)arg1 ; // v2.1.2 and up
- (NSString *)lastCharatorTyped;
- (void)insertText:(id)arg1;
- (void)delete;
- (void)deleteByTimer;
- (void)changeToNextLanguage;
// New method
- (void)applyThemeColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor;
- (id)objectForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (CGFloat)floatForKey:(NSString *)key;
- (void)updateSpaceBar;
@end

@interface KSKEmojiKeyboardViewController : UIViewController // com_vanna_KhmerKeyboard_Keyboard.EmojiKeyboardViewController
- (UIViewController *)emojiCollectionViewController;
- (UIView *)bottomButtonBox;
- (UIButton *)swicthButton;
- (UIButton *)recentButton;
- (NSArray *)emojiCategoryButtons;
- (UIButton *)deleteButton;
// New method
- (void)applyThemeColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor;
@end

#define DEBUG 1
#define EN_DATABASE_URL @"https://archive.org/download/english.sqlite3_v1/english.sqlite3_v1.zip"
#define KH_DATABASE_URL @"https://archive.org/download/khmer.sqlite3_v1/khmer.sqlite3_v1.zip"
#define EN_DATABASE_FILE @"english.sqlite3_v1.zip"
#define KH_DATABASE_FILE @"khmer.sqlite3_v1.zip"

static KSKKeyboardViewController *kbController;
static BOOL isSpaceCursorEnabled;
static BOOL KSKClickSoundEnabled;
static CGPoint iniTouchedPoint;
static CGPoint lastTranslatedPoint;

static NSTimer *downloadTimer;

%hook KSKKeyboardView // com_vanna_KhmerKeyboard_Keyboard.KeyboardView
- (void)downloadPredictionDataRequested {
  // %orig;

  [[self clickToDownloadView] setTitle:@"ᗣᗣᗣᗣ កំពុងទាញយក ᗧ·····◦" forState:UIControlStateNormal];
  downloadTimer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                   target:self
                                                 selector:@selector(updateDownloadLabel)
                                                 userInfo:nil
                                                  repeats:YES];
  NSError *error;

  KSKSpaceButton *spaceButton = [self spaceButton];
  NSString *spaceText = spaceButton.centerLabel.text;
  if ([spaceText canBeConvertedToEncoding:NSASCIIStringEncoding]) {
    [self downloadDictDatabase:EN_DATABASE_URL outputFile:EN_DATABASE_FILE error:&error];
  } else {
    [self downloadDictDatabase:KH_DATABASE_URL outputFile:KH_DATABASE_FILE error:&error];
  }
}

%new
- (BOOL)downloadDictDatabase:(NSString *)databaseURL
                  outputFile:(NSString *)outputFile
                       error:(NSError **)mainError
{
  NSURLSession *session = [NSURLSession sharedSession];
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSURL *documentsURL = [fileManager URLsForDirectory:NSDocumentDirectory
                                            inDomains:NSUserDomainMask][0];
  NSURL *link = [NSURL URLWithString:databaseURL];
  NSURL *fileURL = [documentsURL URLByAppendingPathComponent:outputFile];

  // If zip file is already there
  if ([fileManager fileExistsAtPath:fileURL.path]) {
    NSError *unzipError;
    BOOL unzipStatus = [SSZipArchive unzipFileAtPath:fileURL.path
                                       toDestination:documentsURL.path
                                           overwrite:YES
                                            password:nil
                                               error:&unzipError];
    if (unzipStatus) {
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC),
                     dispatch_get_main_queue(), ^{
        [[self clickToDownloadView] setTitle:@"ទាញយកដោយជោគជ័យ! (ﾉ´ヮ´)ﾉ*:･ﾟ✧"
                                    forState:UIControlStateNormal];
        [fileManager removeItemAtPath:fileURL.path error:nil];
        [self performSelector:@selector(updatePredictionBar) withObject:nil afterDelay:5.0];
      });
      return YES;
    } else {
      HBLogInfo(@"Unzip error: %@. File will be removed and re-downloaded.", unzipError.description);
      [fileManager removeItemAtPath:fileURL.path error:nil];
    }
  }

  // Else download a new zip file
  NSURLRequest *request = [NSURLRequest requestWithURL:link];
  [[session downloadTaskWithRequest:request
              completionHandler:^(NSURL *location,
                                  NSURLResponse *response,
                                  NSError *downloadError) {
        if (downloadError) {
          HBLogError(@"Download Error: %@", downloadError.description);
          //TODO: Re-display the download button
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC),
                         dispatch_get_main_queue(), ^{
            [[self clickToDownloadView] setTitle:@"ការទាញយកបរាជ័យ (ノಠ益ಠ)ノ彡┻━┻"
                                        forState:UIControlStateNormal];
            [self performSelector:@selector(updatePredictionBar) withObject:nil afterDelay:5.0];
          });
          return;
        } else {
          // Stop updating downloading label
          [downloadTimer invalidate];
          downloadTimer = nil;

          NSError *moveError;
          NSError *unzipError;
          if (![fileManager moveItemAtURL:location toURL:fileURL error:&moveError] ||
              ![SSZipArchive unzipFileAtPath:fileURL.path
                                       toDestination:documentsURL.path
                                           overwrite:YES
                                            password:nil
                                               error:&unzipError])
          {
            HBLogError(@"Moving file failed: %@", moveError.description);
#ifdef DEBUG
            NSString *logFile = [documentsURL.path stringByAppendingPathComponent:@"log.txt"];
            [moveError.description writeToFile:logFile
                                    atomically:YES
                                      encoding:NSUTF8StringEncoding
                                         error:nil];
#endif
            //TODO: Re-display the download button
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC),
                           dispatch_get_main_queue(), ^{
              [[self clickToDownloadView] setTitle:@"មិនអាចពន្លាឯកសារបាន (ノಠ益ಠ)ノ彡┻━┻"
                                          forState:UIControlStateNormal];
              [self performSelector:@selector(updatePredictionBar) withObject:nil afterDelay:5.0];
            });
            return;
          }

          [fileManager removeItemAtPath:fileURL.path error:nil];
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC),
                         dispatch_get_main_queue(), ^{
            [[self clickToDownloadView] setTitle:@"ទាញយកដោយជោគជ័យ! (ﾉ´ヮ´)ﾉ*:･ﾟ✧"
                                        forState:UIControlStateNormal];
            [self performSelector:@selector(updatePredictionBar) withObject:nil afterDelay:5.0];
          });
        }
    }] resume];

  if (mainError) {
    return NO;
  } else {
    return YES;
  }
}

%new
- (void)updatePredictionBar {
  [self initializeKeyboard];
  if (kbController != nil) {
    [kbController updateSpaceBar];
  }
}

%new
- (void)updateDownloadLabel {
  NSString *updatedTitle = [self clickToDownloadView].currentTitle;
  if ([updatedTitle rangeOfString:@"ᗧ·"].location != NSNotFound) {
    updatedTitle = [updatedTitle stringByReplacingOccurrencesOfString:@"ᗧ·" withString:@"O"];
    updatedTitle = [updatedTitle stringByAppendingString:@"·"];
  } else if ([updatedTitle rangeOfString:@"ᗧ◦"].location != NSNotFound) {
    updatedTitle = [updatedTitle stringByReplacingOccurrencesOfString:@"ᗧ◦" withString:@"O"];
    updatedTitle = [updatedTitle stringByAppendingString:@"◦"];
  } else if ([updatedTitle rangeOfString:@"O"].location != NSNotFound) {
    updatedTitle = [updatedTitle stringByReplacingOccurrencesOfString:@"O" withString:@"ᗧ"];
  }
  [[self clickToDownloadView] setTitle:updatedTitle forState:UIControlStateNormal];
}

// Re-implement the hold-to-delete method to fix the bug where the delete method stops working after
// a few seconds. There is still a problem because this action does not get called continuously
- (void)handleLongPressForDeleteButtonWithGestureRecognizer:(UILongPressGestureRecognizer *)longPressGesture {
  if (longPressGesture.state == UIGestureRecognizerStateChanged && kbController) {
    [kbController.textDocumentProxy deleteBackward];
    if (KSKClickSoundEnabled) {
      NSString *textBefore = [kbController.textDocumentProxy documentContextBeforeInput];
      if (!textBefore || [textBefore isEqualToString:@""]) {
        return;
      }
      AudioServicesPlaySystemSound(1104);
    }
  }
}

// Long press on space bar to switch between internal keyboards
- (void)handleLongPressForSpaceButtonWithGestureRecognizer:(UILongPressGestureRecognizer *)longPressGesture {
  if (!isSpaceCursorEnabled) {
    return %orig;
  } else if (longPressGesture.state == UIGestureRecognizerStateBegan) {
    [self changeToNextLanguage];
    if (KSKClickSoundEnabled) {
      AudioServicesPlaySystemSound(1104);
    }

    if (kbController != nil) {
      [kbController updateSpaceBar];
    }
  }
}

- (void)layoutSubviews {
  %orig;

  if (!kbController) {
    return;
  }

  // Color Keyboard Theme
  NSInteger themeOption = [kbController integerForKey:@"KSKSelectedThemeOption"];
  if (themeOption == 0) {
    return;
  }

  NSString *kbBackgroundColorHex = [kbController objectForKey:@"keyboardBackgroundColor"];
  NSString *kbForegroundColorHex = [kbController objectForKey:@"keyboardForegroundColor"];
  UIColor *kbBackgroundColor = LCPParseColorString(kbBackgroundColorHex, @"#1E4679");
  UIColor *kbForegroundColor = LCPParseColorString(kbForegroundColorHex, @"#FFFFFF");
  if (themeOption == 2) {
    kbBackgroundColor = [UIColor clearColor];
  }

  [[self adsAndPredictionView] setBackgroundColor:kbBackgroundColor];
  [kbController applyThemeColor:kbBackgroundColor foregroundColor:kbForegroundColor];

  if (themeOption != 2) {
    return;
  }

  // Keyboard's background image
  NSString *backgroundImagePath = [kbController objectForKey:@"KSKBackgroundImage"];
  CGFloat overlayAlpha = [kbController floatForKey:@"KSKBackgroundAlpha"] ?: 0;
  if (backgroundImagePath && ![backgroundImagePath isEqualToString:@""]) {
    NSData *imageData = [NSData dataWithContentsOfFile:backgroundImagePath];
    UIImage *backgroundImage = [UIImage imageWithData:imageData];
    // UIImage *scaledImage = [self imageWithImage:backgroundImage scaledToSize:[self frame].size];
    if (backgroundImage) {
      UIImageView *backgroundImageView = [[[UIImageView alloc] initWithFrame:[self frame]] autorelease];
      backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
      backgroundImageView.image = backgroundImage;
      [self addSubview:backgroundImageView];
      [self sendSubviewToBack:backgroundImageView];

      // Adding overlay view over image view to darken the image
      UIView *overlayView = [[[UIView alloc] initWithFrame:[self frame]] autorelease];
      overlayView.backgroundColor = [UIColor blackColor];
      overlayView.alpha = overlayAlpha;
      [backgroundImageView addSubview:overlayView];
    }
  }
}

- (void)altButtonPressed:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)emojiButtonPressed:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)deleteButtonPressed:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)returnButtonPressed:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)advanceToNextInputMode {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

%new
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
  UIGraphicsBeginImageContext(newSize);
  [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}
%end

%hook KSKKeyboardViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
- (void)viewDidAppear:(BOOL)arg1 {
  %orig;

  // Pick the input view controller
  kbController = self;

  // Apply ZWSP Settings
  BOOL isZWSPEnabled = [self boolForKey:@"isZWSPEnabled"];
  if ([self respondsToSelector:@selector(setUseZeroSpace:)]) { // v2.1.1 and down
    [self setUseZeroSpace:isZWSPEnabled];
  } else if ([self respondsToSelector:@selector(setIsZeroSpace:)]) { // v2.1.2 and up
    [self setIsZeroSpace:isZWSPEnabled];
  }

  isSpaceCursorEnabled = [self boolForKey:@"isSpaceCursorEnabled"];
  KSKClickSoundEnabled = [self boolForKey:@"KSKClickSoundEnabled"];
}

- (void)viewDidLayoutSubviews {
  %orig;
  [self updateSpaceBar];

  /*
  // Try solving the long pressing delete button bug, but this does not solve it.
  // Commented out for now

  for (KSKControlButton *controlButton in [[self keyboardView] subviews]) {
    NSArray *gestureRecognizers = controlButton.gestureRecognizers;
    if ([gestureRecognizers count] == 2 &&
        [gestureRecognizers[0] isKindOfClass:%c(UILongPressGestureRecognizer)] &&
        [gestureRecognizers[1] isKindOfClass:%c(UISwipeGestureRecognizer)]) {

      UILongPressGestureRecognizer *longPressGesture = gestureRecognizers[0];
      UISwipeGestureRecognizer *swipeGesture = gestureRecognizers[1];
      [swipeGesture requireGestureRecognizerToFail:longPressGesture];
    }
  }
  */
}

%new
- (void)updateSpaceBar {
  // Change space bar label text
  KSKSpaceButton *spaceButton = [self keyboardView].spaceButton;
  NSString *origText = spaceButton.centerLabel.text;
  if ([origText canBeConvertedToEncoding:NSASCIIStringEncoding]) {
    spaceButton.centerLabel.text = @"fidele007";
  } else {
    spaceButton.centerLabel.text = @"ហ្វីដែល០០៧";
  }
  [[self keyboardView] setSpaceButton:spaceButton];

  if (isSpaceCursorEnabled) {
    // Add swipe up gesture for space bar to re-implement ? and ។ keys
    KSKSpaceButton *spaceButton = [self keyboardView].spaceButton;
    UISwipeGestureRecognizer *spaceBarSwipeGesture = [[UISwipeGestureRecognizer alloc]
                                                        initWithTarget:spaceButton
                                                                action:@selector(handleSpaceBarSwipeUp:)];
    spaceBarSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    for (UIGestureRecognizer *gesture in spaceButton.gestureRecognizers) {
      [gesture requireGestureRecognizerToFail:spaceBarSwipeGesture];
    }
    [spaceButton addGestureRecognizer:spaceBarSwipeGesture];
    [spaceBarSwipeGesture release];
  }
}

%new
- (id)objectForKey:(NSString *)key {
  if ([[self sharedDefaults] objectForKey:key]) {
    return [[self sharedDefaults] objectForKey:key];
  } else {
    NSUserDefaults *newDefaults = [[[NSUserDefaults alloc] initWithSuiteName:@"group.alien-dev.keyboard"] autorelease];
    return [newDefaults objectForKey:key];
  }
}

%new
- (NSInteger)integerForKey:(NSString *)key {
  if ([[self sharedDefaults] objectForKey:key]) {
    return [[self sharedDefaults] integerForKey:key];
  } else {
    NSUserDefaults *newDefaults = [[[NSUserDefaults alloc] initWithSuiteName:@"group.alien-dev.keyboard"] autorelease];
    return [newDefaults integerForKey:key];
  }
}

%new
- (BOOL)boolForKey:(NSString *)key {
  if ([[self sharedDefaults] objectForKey:key]) {
    return [[self sharedDefaults] boolForKey:key];
  } else {
    NSUserDefaults *newDefaults = [[[NSUserDefaults alloc] initWithSuiteName:@"group.alien-dev.keyboard"] autorelease];
    return [newDefaults boolForKey:key];
  }
}

%new
- (CGFloat)floatForKey:(NSString *)key {
  if ([[self sharedDefaults] objectForKey:key]) {
    return [[self sharedDefaults] floatForKey:key];
  } else {
    NSUserDefaults *newDefaults = [[[NSUserDefaults alloc] initWithSuiteName:@"group.alien-dev.keyboard"] autorelease];
    return [newDefaults floatForKey:key];
  }
}

%new
- (void)applyThemeColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor {
  KSKKeyboardView *keyboardView = [self keyboardView];
  // Background color
  keyboardView.backgroundColor = backgroundColor;
  for (UIView *subview in [keyboardView subviews]) {
    subview.backgroundColor = backgroundColor;
    if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.LightBox")]) {
      subview.currentView.backgroundColor = backgroundColor;

      // Foreground color
      if (![[subview currentView] respondsToSelector:@selector(predictionView)]) {
        // if |subview| is SimpleInfoView (no dictionary database downloaded)
        continue;
      }
      // if |subview| is AdsAndPredictionView (with dictionary database)
      UIScrollView *scrollView = [[subview currentView] predictionView];
      for (UIButton *suggestionBox in [scrollView subviews]) {
        if ([suggestionBox respondsToSelector:@selector(setTitleColor:forState:)]) {
          [suggestionBox setTitleColor:foregroundColor forState:UIControlStateNormal];
        }
      }
    } else if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.ControlButton")]) {
      [subview setTitleColor:foregroundColor forState:UIControlStateNormal];
    } else if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton")]) {
      [[subview leftLabel] setTextColor:foregroundColor];
      [[subview centerLabel] setTextColor:foregroundColor];
      [[subview rightLabel] setTextColor:foregroundColor];
    } else if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.CharacterButtonsContainer")]) {
      for (UIButton *charButton in [subview subviews]) {
        if ([charButton respondsToSelector:@selector(setTextColor:)]) {
          [charButton setTextColor:foregroundColor];
        }
      }
    }
  }
}
%end

%hook KSKSpaceButton // com_vanna_KhmerKeyboard_Keyboard.SpaceButton
- (void)buttonPanned:(UIPanGestureRecognizer *)panGesture {
  if (KSKClickSoundEnabled && panGesture.state == UIGestureRecognizerStateEnded) {
    AudioServicesPlaySystemSound(1104);
  }

  // Implement cursor moving using the space bar
  if (!isSpaceCursorEnabled) {
    return %orig;
  }

  if (panGesture.state == UIGestureRecognizerStateBegan) {
    iniTouchedPoint = [panGesture locationInView:self];
  } else if (panGesture.state == UIGestureRecognizerStateChanged) {
    if (!kbController) {
      return %orig;
    }

    CGPoint translatedPoint = [panGesture translationInView:self];
    if (translatedPoint.x > lastTranslatedPoint.x + 7) {
      [kbController.textDocumentProxy adjustTextPositionByCharacterOffset:1];
      lastTranslatedPoint = translatedPoint;
    } else if (translatedPoint.x < lastTranslatedPoint.x - 7) {
      [kbController.textDocumentProxy adjustTextPositionByCharacterOffset:-1];
      lastTranslatedPoint = translatedPoint;
    }
  } else {
    %orig;
  }
}

- (void)handleTap:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

%new
- (void)handleSpaceBarSwipeUp:(UISwipeGestureRecognizer *)swipeGesture {
  CGPoint touchedPoint = [swipeGesture locationInView:self];
  if (touchedPoint.x < 30) {
    [self animateWayUp:[self leftLabel]];
    [kbController insertText:[self leftCharacter]];
  } else if (touchedPoint.x > [self frame].size.width - 30) {
    [self animateWayUp:[self rightLabel]];
    [kbController insertText:[self rightCharacter]];
  }

  if (KSKClickSoundEnabled && swipeGesture.state == UIGestureRecognizerStateEnded) {
    AudioServicesPlaySystemSound(1104);
  }
}
%end

%hook KSKEmojiKeyboardViewController // com_vanna_KhmerKeyboard_Keyboard.EmojiKeyboardViewController
- (void)viewDidAppear:(BOOL)appear {
  %orig;

  if (!appear) {
    return;
  }

  // Emoji Keyboard Theme
  if (!kbController) {
    return;
  }

  // Emoji keyboard's theme
  NSInteger themeOption = [kbController integerForKey:@"KSKSelectedThemeOption"];
  if (themeOption == 0) {
    return;
  } else if (themeOption == 1) {
    NSString *kbBackgroundColorHex = [kbController objectForKey:@"keyboardBackgroundColor"];
    NSString *kbForegroundColorHex = [kbController objectForKey:@"keyboardForegroundColor"];
    UIColor *kbBackgroundColor = LCPParseColorString(kbBackgroundColorHex, @"#1E4679");
    UIColor *kbForegroundColor = LCPParseColorString(kbForegroundColorHex, @"#FFFFFF");
    [self applyThemeColor:kbBackgroundColor foregroundColor:kbForegroundColor];
    return;
  } else if (themeOption == 2) {
    [self applyThemeColor:[UIColor clearColor] foregroundColor:nil];
    NSString *backgroundImagePath = [kbController objectForKey:@"KSKBackgroundImage"];
    CGFloat overlayAlpha = [kbController floatForKey:@"KSKBackgroundAlpha"] ?: 0;
    if (backgroundImagePath && ![backgroundImagePath isEqualToString:@""]) {
      NSData *imageData = [NSData dataWithContentsOfFile:backgroundImagePath];
      UIImage *backgroundImage = [UIImage imageWithData:imageData];
      if (backgroundImage) {
        UIImageView *backgroundImageView = [[[UIImageView alloc] initWithFrame:[[self view] frame]] autorelease];
        backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        backgroundImageView.image = backgroundImage;
        [[self view] addSubview:backgroundImageView];
        [[self view] sendSubviewToBack:backgroundImageView];

        // Adding overlay view over image view to darken the image
        UIView *overlayView = [[[UIView alloc] initWithFrame:[[self view] frame]] autorelease];
        overlayView.backgroundColor = [UIColor blackColor];
        overlayView.alpha = overlayAlpha;
        [backgroundImageView addSubview:overlayView];
      }
    }
  }
}

- (void)abcButtonClicked {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)emojiButtonClicked:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)deleteButtonPressed:(id)arg1 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

%new
- (void)applyThemeColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor {
  // Background color
  [self view].backgroundColor = backgroundColor;
  UICollectionViewController *emojiCollectionViewController =
    (UICollectionViewController *)[self emojiCollectionViewController];
  emojiCollectionViewController.collectionView.backgroundColor = backgroundColor;

  [self bottomButtonBox].backgroundColor = backgroundColor;

  // // Foreground color
  // [[self swicthButton] setTitleColor:foregroundColor forState:UIControlStateNormal];
  // [[self deleteButton] setTitleColor:foregroundColor forState:UIControlStateNormal];
  // [[self recentButton] setTitleColor:foregroundColor forState:UIControlStateNormal];
  // for (UIButton *emojiCategoryButton in [self emojiCategoryButtons]) {
  //   if ([emojiCategoryButton respondsToSelector:@selector(setTitleColor:forState:)]) {
  //     [emojiCategoryButton setTitleColor:foregroundColor forState:UIControlStateNormal];
  //   }
  // }
}
%end

%hook KSKEmojiCollectionViewController // com_vanna_KhmerKeyboard_Keyboard.EmojiKeyboardViewController
- (void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2 {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}
%end

%hook KSKCharacterButton // com_vanna_KhmerKeyboard_Keyboard.CharacterButton
- (void)buttonPressed {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}

- (void)buttonPanned:(UIPanGestureRecognizer *)gesture {
  %orig;
  if (KSKClickSoundEnabled && gesture.state == UIGestureRecognizerStateEnded) {
    AudioServicesPlaySystemSound(1104);
  }
}
%end

%hook KSKSuggestionButton // com_vanna_KhmerKeyboard_Keyboard.SuggestionButton
- (void)buttonPressed {
  %orig;
  if (KSKClickSoundEnabled) {
    AudioServicesPlaySystemSound(1104);
  }
}
%end

// Update space bar with labels and gestures when choosing keyboard from globe popup view
%hook KSKGlobePopupView //com_vanna_KhmerKeyboard_Keyboard.GlobePopupView
- (void)buttonPressed:(id)arg1 {
  %orig;
  if (kbController != nil) {
    [kbController updateSpaceBar];
  }
}
%end

%ctor {
  %init(KSKKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController"),
        KSKKeyboardView = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardView"),
        KSKSuggestionButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SuggestionButton"),
        KSKCharacterButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.CharacterButton"),
        KSKSpaceButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton"),
        KSKEmojiKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.EmojiKeyboardViewController"),
        KSKEmojiCollectionViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.EmojiCollectionViewController"),
        KSKGlobePopupView = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.GlobePopupView")
       );
}