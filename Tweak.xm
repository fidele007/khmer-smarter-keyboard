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
@end

@interface KSKKeyboardViewController : UIInputViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
@property (assign,nonatomic) BOOL useZeroSpace;
@property (retain,nonatomic) KSKKeyboardView *keyboardView;
@property (retain,nonatomic) NSUserDefaults *sharedDefaults; 
- (NSUserDefaults *)sharedDefaults;
- (BOOL)useZeroSpace;
- (void)setUseZeroSpace:(BOOL)arg1;
- (NSString *)lastCharatorTyped;
- (void)insertText:(id)arg1;
- (void)delete;
- (void)deleteByTimer;
- (void)changeToNextLanguage;
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
%end

%hook KSKKeyboardViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
- (void)viewDidAppear:(BOOL)arg1 {
  %orig;

  // Pick the input view controller
  kbController = self;

  // Apply ZWSP Settings
  BOOL isZWSPEnabled = [[self sharedDefaults] boolForKey:@"isZWSPEnabled"];
  [self setUseZeroSpace:isZWSPEnabled];

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

  // Keyboard Theme
  BOOL isThemeEnabled = [[self sharedDefaults] boolForKey:@"isThemeEnabled"];
  if (isThemeEnabled) {
    NSString *kbBackgroundColorHex = [[self sharedDefaults] objectForKey:@"keyboardBackgroundColor"];
    NSString *kbForegroundColorHex = [[self sharedDefaults] objectForKey:@"keyboardForegroundColor"];
    UIColor *kbBackgroundColor = LCPParseColorString(kbBackgroundColorHex, @"#1E4679");
    UIColor *kbForegroundColor = LCPParseColorString(kbForegroundColorHex, @"#FFFFFF");
    [self applyThemeColor:kbBackgroundColor foregroundColor:kbForegroundColor];
  }

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

%ctor {
  %init(KSKKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController"),
        KSKKeyboardView = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardView"),
        KSKSpaceButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton")
       );
}