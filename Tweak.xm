@interface UIView (KhmerSmarterKeyboard)
@property (retain,nonatomic) UIView *currentView; 
@end

@interface KSKControlButton : UIButton
@end

@interface KSKSpaceButton : UIButton
@property (retain,nonatomic) UILabel *centerLabel;
@property (retain,nonatomic) UILabel * leftLabel;
@property (retain,nonatomic) UILabel *rightLabel;
@property (copy,nonatomic) NSString *leftCharacter;
@property (copy,nonatomic) NSString *rightCharacter;
- (void)animateWayUp:(id)arg1;
@end

@interface KSKKeyboardView : UIView
@property (retain,nonatomic) KSKSpaceButton *spaceButton; 
- (void)setSpaceButton:(KSKSpaceButton *)spaceButton;
@end

@interface KSKKeyboardViewController : UIInputViewController
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
// New method
- (void)applyThemeColor:(UIColor *)color;
@end

static KSKKeyboardViewController *kbController;
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
%end

%hook KSKKeyboardViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
- (void)viewDidAppear:(BOOL)arg1 {
  %orig;

  // Apply ZWSP Settings
  BOOL isZWSPEnabled = [[self sharedDefaults] boolForKey:@"isZWSPEnabled"];
  [self setUseZeroSpace:isZWSPEnabled];

  // Pick the input view controller
  kbController = self;
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

  // Add swipe up gesture for space bar to re-implement ? and ។ keys
  UISwipeGestureRecognizer *spaceBarSwipeGesture = [[[UISwipeGestureRecognizer alloc] 
                                                          initWithTarget:spaceButton
                                                                  action:@selector(handleSpaceBarSwipeUp:)] 
                                                                      autorelease];
  spaceBarSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
  [spaceButton addGestureRecognizer:spaceBarSwipeGesture];

  for (UIPanGestureRecognizer *panGesture in spaceButton.gestureRecognizers) {
    [panGesture requireGestureRecognizerToFail:spaceBarSwipeGesture];
  }

  // Keyboard Theme
  [self applyThemeColor:[UIColor colorWithRed:155.0/255.0 green:89.0/255.0 blue:182.0/255.0 alpha:1.0]];

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
- (void)applyThemeColor:(UIColor *)color {
  KSKKeyboardView *keyboardView = [self keyboardView];
  for (UIView *subview in [keyboardView subviews]) {
    if ([subview isKindOfClass:objc_getClass("com_vanna_KhmerKeyboard_Keyboard.LightBox")]) {
      subview.currentView.backgroundColor = color;
      continue;
    }
    subview.backgroundColor = color;
  }
}
%end

%hook KSKSpaceButton // com_vanna_KhmerKeyboard_Keyboard.SpaceButton
- (void)buttonPanned:(UIPanGestureRecognizer *)panGesture {
  // Implement cursor moving using the space bar
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