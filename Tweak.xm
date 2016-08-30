@interface KSKSpaceButton : UIButton
@property (retain,nonatomic) UILabel * centerLabel;
@end

@interface KSKKeyboardView : UIView
@property (retain,nonatomic) KSKSpaceButton *spaceButton; 
- (void)setSpaceButton:(KSKSpaceButton *)spaceButton ;
@end

@interface KSKKeyboardViewController : UIInputViewController
@property (assign,nonatomic) BOOL useZeroSpace;
@property (retain,nonatomic) KSKKeyboardView *keyboardView;
- (BOOL)useZeroSpace;
- (void)setUseZeroSpace:(BOOL)arg1 ;
- (NSString *)lastCharatorTyped;
@end

static KSKKeyboardViewController *kbController;
static CGPoint iniTouchedPoint;
static CGPoint lastTranslatedPoint;

// %hook KSKKeyboardView // com_vanna_KhmerKeyboard_Keyboard.KeyboardView
// %end

%hook KSKKeyboardViewController // com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController
- (void)viewDidAppear:(BOOL)arg1 {
  %orig;

  // Set to always zero-width space
  if (![self useZeroSpace]) {
    [self setUseZeroSpace:YES];
  }

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
    if (iniTouchedPoint.x < 30 || iniTouchedPoint.x > [self frame].size.width - 30) {
      return %orig;
    } 

    if (translatedPoint.x > lastTranslatedPoint.x + 5) {
      [kbController.textDocumentProxy adjustTextPositionByCharacterOffset:1];
      lastTranslatedPoint = translatedPoint;
    } else if (translatedPoint.x < lastTranslatedPoint.x - 5) {
      [kbController.textDocumentProxy adjustTextPositionByCharacterOffset:-1];
      lastTranslatedPoint = translatedPoint;
    }
  } else {
    %orig;
  }

}
%end

%ctor {
  %init(KSKKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController"),
        KSKSpaceButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton")
       );

  // %init(KSKKeyboardViewController = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardViewController"),
  //       KSKSpaceButton = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.SpaceButton"),
  //       KSKKeyboardView = objc_getClass("com_vanna_KhmerKeyboard_Keyboard.KeyboardView")
  //      );
}