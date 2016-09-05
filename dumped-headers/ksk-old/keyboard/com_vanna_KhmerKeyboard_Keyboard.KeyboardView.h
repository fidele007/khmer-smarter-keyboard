/*
* This header is generated by classdump-dyld 1.0
* on Thursday, August 25, 2016 at 4:47:06 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <UIKit/UIView.h>

@class NSString, _TtC32com_vanna_KhmerKeyboard_Keyboard22KeyboardViewController, _TtC32com_vanna_KhmerKeyboard_Keyboard25CharacterButtonsContainer, _TtC32com_vanna_KhmerKeyboard_Keyboard13ControlButton, _TtC32com_vanna_KhmerKeyboard_Keyboard20AdsAndPredictionView, _TtC32com_vanna_KhmerKeyboard_Keyboard30AllowFullAccessInstructionView, _TtC32com_vanna_KhmerKeyboard_Keyboard8LightBox, _TtC32com_vanna_KhmerKeyboard_Keyboard11SpaceButton, _TtC32com_vanna_KhmerKeyboard_Keyboard14GlobePopupView, _TtC32com_vanna_KhmerKeyboard_Keyboard25PredictionDownloadingView, _TtC32com_vanna_KhmerKeyboard_Keyboard14SimpleInfoView;

@interface com_vanna_KhmerKeyboard_Keyboard.KeyboardView : UIView {

	 spacing;
	 ICON_FONT_SIZE;
	 lastY;
	 keyWidth;
	 keyHeight;
	 debugBoxHeight;
	 predictiveTextBoxHeight;
	 lastSuggestedWord;
	 maxThreeClickedSuggestions;
	 deleteButtonTimer;
	 spaceButtonTimer;
	 keyboard;
	 sharedDefaults;
	 keyboardHeightManager;
	 keyboardViewcontroller;
	 characterButtonsContainer;
	 controllbutton;
	 predictionOperations;
	 adsAndPredictionView;
	 allowFullAccessInstructionView;
	 lightBox;
	 altButton;
	 emojiButton;
	 spaceButton;
	 nextKeyboardButton;
	 returnButton;
	 deleteButton;
	 themeManager;
	 globePopupView;
	 theme;
	 haveFullAccess;
	 predictionDownloadView;
	 clickToDownloadView;
	 deleteGestureIndicator;
	 keyboardHeight;
	 altMode;
	 languageProviderManager;
	 languageProvider;
	 controlButtons.storage;
	 controlButtonFrames.storage;
	 additionalCharacterButtons.storage;
	 additionalCharacterButtonFrames.storage;

}

@property (copy,nonatomic) NSString * lastSuggestedWord; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard22KeyboardViewController * keyboardViewcontroller; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard25CharacterButtonsContainer * characterButtonsContainer; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard13ControlButton * controllbutton; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard20AdsAndPredictionView * adsAndPredictionView; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard30AllowFullAccessInstructionView * allowFullAccessInstructionView; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard8LightBox * lightBox; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard11SpaceButton * spaceButton; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14GlobePopupView * globePopupView; 
@property (assign,nonatomic) BOOL haveFullAccess; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard25PredictionDownloadingView * predictionDownloadView; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SimpleInfoView * clickToDownloadView; 
-(void)applyTheme;
-(void)deleteButtonPressed:(id)arg1 ;
-(void)handleLongPressForDeleteButtonWithGestureRecognizer:(id)arg1 ;
-(void)handleSwipeLeftForDeleteButtonWithGestureRecognizer:(id)arg1 ;
-(void)handleDeleteButtonTimerTick:(id)arg1 ;
-(void)setupEvents;
-(void)initializeKeyboard;
-(void)updateSuggestions;
-(void)changeToPreviousLanguage;
-(void)changeToNextLanguage;
-(void)animateToShortMode;
-(NSString *)lastSuggestedWord;
-(void)setLastSuggestedWord:(NSString *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard22KeyboardViewController *)keyboardViewcontroller;
-(void)setKeyboardViewcontroller:(_TtC32com_vanna_KhmerKeyboard_Keyboard22KeyboardViewController *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard25CharacterButtonsContainer *)characterButtonsContainer;
-(void)setCharacterButtonsContainer:(_TtC32com_vanna_KhmerKeyboard_Keyboard25CharacterButtonsContainer *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard13ControlButton *)controllbutton;
-(void)setControllbutton:(_TtC32com_vanna_KhmerKeyboard_Keyboard13ControlButton *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard20AdsAndPredictionView *)adsAndPredictionView;
-(void)setAdsAndPredictionView:(_TtC32com_vanna_KhmerKeyboard_Keyboard20AdsAndPredictionView *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard30AllowFullAccessInstructionView *)allowFullAccessInstructionView;
-(void)setAllowFullAccessInstructionView:(_TtC32com_vanna_KhmerKeyboard_Keyboard30AllowFullAccessInstructionView *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard8LightBox *)lightBox;
-(void)setLightBox:(_TtC32com_vanna_KhmerKeyboard_Keyboard8LightBox *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard11SpaceButton *)spaceButton;
-(void)setSpaceButton:(_TtC32com_vanna_KhmerKeyboard_Keyboard11SpaceButton *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14GlobePopupView *)globePopupView;
-(void)setGlobePopupView:(_TtC32com_vanna_KhmerKeyboard_Keyboard14GlobePopupView *)arg1 ;
-(BOOL)haveFullAccess;
-(void)setHaveFullAccess:(BOOL)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard25PredictionDownloadingView *)predictionDownloadView;
-(void)setPredictionDownloadView:(_TtC32com_vanna_KhmerKeyboard_Keyboard25PredictionDownloadingView *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SimpleInfoView *)clickToDownloadView;
-(void)setClickToDownloadView:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SimpleInfoView *)arg1 ;
-(void)calculateKeyHeights:(double)arg1 ;
-(void)calculateKeyWidth;
-(void)handleLongpressSelectionKeyboard:(id)arg1 ;
-(void)showGlobePopup;
-(void)hideGlobePopup;
-(void)changeToDarkMode;
-(void)changeToLightMode;
-(void)returnButtonPressed:(id)arg1 ;
-(void)altButtonPressed:(id)arg1 ;
-(void)emojiButtonPressed:(id)arg1 ;
-(void)handleLongPressForSpaceButtonWithGestureRecognizer:(id)arg1 ;
-(void)handleSpaceButtonTimerTick:(id)arg1 ;
-(void)refreshLabels;
-(void)updateSpacebarLabels;
-(void)checkAltMode;
-(void)onSwipeRight;
-(void)twoFingersSwippedDown;
-(void)twoFingersSwippedUp;
-(void)changeToLanguage:(id)arg1 ;
-(void)initSuggestionViews;
-(void)checkFullAccess;
-(void)showClickToDownloadPredictionData;
-(void)downloadPredictionDataRequested;
-(void)onSuggestonSelected:(id)arg1 ;
-(void)preparePredictionOperations;
-(void)saveUnigram:(id)arg1 ;
-(void)saveBigram:(id)arg1 term2:(id)arg2 ;
-(void)saveTrigram:(id)arg1 term2:(id)arg2 term3:(id)arg3 ;
-(void)suggestUnigram:(id)arg1 ;
-(void)suggestBigram:(id)arg1 ;
-(void)suggestBigramAndUnigram:(id)arg1 chunk:(id)arg2 ;
-(void)suggestTrigram:(id)arg1 secondWord:(id)arg2 ;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)dealloc;
-(void)advanceToNextInputMode;
@end

