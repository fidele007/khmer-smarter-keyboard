#include <libcolorpicker.h>

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
@end

@interface KSKKeyboardViewController : UIInputViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
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

static KSKKeyboardViewController *kbController;
static BOOL isSpaceCursorEnabled;
static CGPoint iniTouchedPoint;
static CGPoint lastTranslatedPoint;

%hook KSKKeyboardView // com_vanna_KhmerKeyboard_Keyboard.KeyboardView
// Re-implement the hold-to-delete method to fix the bug where the delete method stops working after
// a few seconds. There is still a problem because this action does not get called continuously
- (void)handleLongPressForDeleteButtonWithGestureRecognizer:(UILongPressGestureRecognizer *)longPressGesture {
  if (longPressGesture.state == UIGestureRecognizerStateChanged && kbController) {
    [kbController.textDocumentProxy deleteBackward];
  }
}

// Long press on space bar to switch between internal keyboards
- (void)handleLongPressForSpaceButtonWithGestureRecognizer:(UILongPressGestureRecognizer *)longPressGesture {
  if (longPressGesture.state == UIGestureRecognizerStateBegan) {
    [self changeToNextLanguage];
  }
}

- (void)layoutSubviews {
  %orig;
  
  // Keyboard's background image
  if (!kbController) {
    return;
  }

  NSInteger themeOption = [[kbController sharedDefaults] integerForKey:@"KSKSelectedThemeOption"];
  if (themeOption != 2) {
    return;
  }

  NSString *backgroundImagePath = [[kbController sharedDefaults] objectForKey:@"KSKBackgroundImage"];
  CGFloat overlayAlpha = [[kbController sharedDefaults] floatForKey:@"KSKBackgroundAlpha"] ?: 0;
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
  BOOL isZWSPEnabled = [[self sharedDefaults] boolForKey:@"isZWSPEnabled"];
  if ([self respondsToSelector:@selector(setUseZeroSpace:)]) { // v2.1.1 and down
    [self setUseZeroSpace:isZWSPEnabled];
  } else if ([self respondsToSelector:@selector(setIsZeroSpace:)]) { // v2.1.2 and up
    [self setIsZeroSpace:isZWSPEnabled];
  }

  isSpaceCursorEnabled = [[self sharedDefaults] boolForKey:@"isSpaceCursorEnabled"];
}

- (void)viewDidLayoutSubviews {  
  %orig;
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

  // Color Keyboard Theme
  NSInteger themeOption = [[self sharedDefaults] integerForKey:@"KSKSelectedThemeOption"];
  if (themeOption == 0) {
    return;
  }

  NSString *kbBackgroundColorHex = [[self sharedDefaults] objectForKey:@"keyboardBackgroundColor"];
  NSString *kbForegroundColorHex = [[self sharedDefaults] objectForKey:@"keyboardForegroundColor"];
  UIColor *kbBackgroundColor = LCPParseColorString(kbBackgroundColorHex, @"#1E4679");
  UIColor *kbForegroundColor = LCPParseColorString(kbForegroundColorHex, @"#FFFFFF");
  if (themeOption == 2) {
    kbBackgroundColor = [UIColor clearColor];
  }
  [self applyThemeColor:kbBackgroundColor foregroundColor:kbForegroundColor];

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
- (void)applyThemeColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor {
  KSKKeyboardView *keyboardView = [self keyboardView];
  // Background color
  keyboardView.backgroundColor = backgroundColor;
  for (UIView *subview in [keyboardView subviews]) {
    subview.backgroundColor = backgroundColor;
    if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.LightBox")]) {
      subview.currentView.backgroundColor = backgroundColor;

      // Foreground color
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

  NSUserDefaults *settings = [kbController sharedDefaults];
  BOOL isThemeEnabled = [settings boolForKey:@"isThemeEnabled"];
  if (isThemeEnabled) {
    NSString *kbBackgroundColorHex = [settings objectForKey:@"keyboardBackgroundColor"];
    NSString *kbForegroundColorHex = [settings objectForKey:@"keyboardForegroundColor"];
    UIColor *kbBackgroundColor = LCPParseColorString(kbBackgroundColorHex, @"#1E4679");
    UIColor *kbForegroundColor = LCPParseColorString(kbForegroundColorHex, @"#FFFFFF");
    [self applyThemeColor:kbBackgroundColor foregroundColor:kbForegroundColor];
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

%ctor {
  %init(KSKKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController"),
        KSKKeyboardView = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardView"),
        KSKSpaceButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton"),
        KSKEmojiKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.EmojiKeyboardViewController")
       );
}