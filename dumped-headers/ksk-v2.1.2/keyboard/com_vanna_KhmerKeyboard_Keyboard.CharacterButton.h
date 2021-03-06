/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <com.vanna.KhmerKeyboard.Keyboard/com_vanna_KhmerKeyboard_Keyboard.KeyButton.h>

@class NSDate, NSTimer, UIColor, NSString, UILabel;

@interface com_vanna_KhmerKeyboard_Keyboard.CharacterButton : com_vanna_KhmerKeyboard_Keyboard.KeyButton {

	 buttonTransformationListener;
	 delegate;
	 currentSwipeDirection;
	 keyboardHeightManager;
	 panTime;
	 translation;
	 beginPanTimer;
	 deleteTimer;
	 INITIAL_DELETE_TIMER_INTERVAL;
	 deleteTimerInterval.storage;
	 highlightedBackgroundColor;
	 swipeState;
	 animated;
	 UpLabelNormalSize;
	 UpLabelZoomedSize;
	 textColor;
	 normalBackgroundColor;
	 primaryCharacter;
	 upCharacter;
	 altPrimaryCharacter;
	 altUpCharacter;
	 row;
	 primaryLabel;
	 upLabel;
	 doubleDownLabel;

}

@property (retain,nonatomic) NSDate * panTime; 
@property (retain,nonatomic) NSTimer * beginPanTimer; 
@property (retain,nonatomic) NSTimer * deleteTimer; 
@property (assign,nonatomic) double INITIAL_DELETE_TIMER_INTERVAL; 
@property (assign,nonatomic) double deleteTimerInterval; 
@property (retain,nonatomic) UIColor * highlightedBackgroundColor; 
@property (assign,nonatomic) BOOL animated; 
@property (readonly,nonatomic) double UpLabelNormalSize; 
@property (readonly,nonatomic) double UpLabelZoomedSize; 
@property (retain,nonatomic) UIColor * textColor; 
@property (retain,nonatomic) UIColor * normalBackgroundColor; 
@property (copy,nonatomic) NSString * primaryCharacter; 
@property (copy,nonatomic) NSString * upCharacter; 
@property (copy,nonatomic) NSString * altPrimaryCharacter; 
@property (copy,nonatomic) NSString * altUpCharacter; 
@property (assign,nonatomic) long long row; 
@property (retain,nonatomic) UILabel * primaryLabel; 
@property (retain,nonatomic) UILabel * upLabel; 
@property (retain,nonatomic) UILabel * doubleDownLabel; 
-(NSDate *)panTime;
-(void)setPanTime:(NSDate *)arg1 ;
-(NSTimer *)beginPanTimer;
-(void)setBeginPanTimer:(NSTimer *)arg1 ;
-(NSTimer *)deleteTimer;
-(void)setDeleteTimer:(NSTimer *)arg1 ;
-(double)INITIAL_DELETE_TIMER_INTERVAL;
-(void)setINITIAL_DELETE_TIMER_INTERVAL:(double)arg1 ;
-(double)deleteTimerInterval;
-(void)setDeleteTimerInterval:(double)arg1 ;
-(UIColor *)highlightedBackgroundColor;
-(void)setHighlightedBackgroundColor:(UIColor *)arg1 ;
-(double)UpLabelNormalSize;
-(double)UpLabelZoomedSize;
-(void)setNormalBackgroundColor:(UIColor *)arg1 ;
-(NSString *)primaryCharacter;
-(void)setPrimaryCharacter:(NSString *)arg1 ;
-(NSString *)upCharacter;
-(void)setUpCharacter:(NSString *)arg1 ;
-(NSString *)altPrimaryCharacter;
-(void)setAltPrimaryCharacter:(NSString *)arg1 ;
-(NSString *)altUpCharacter;
-(void)setAltUpCharacter:(NSString *)arg1 ;
-(UILabel *)primaryLabel;
-(void)setPrimaryLabel:(UILabel *)arg1 ;
-(UILabel *)upLabel;
-(void)setUpLabel:(UILabel *)arg1 ;
-(UILabel *)doubleDownLabel;
-(void)setDoubleDownLabel:(UILabel *)arg1 ;
-(void)ensureDoubleDownLabel;
-(void)updateDarkColors;
-(void)updateLightColors;
-(void)layoutLabels;
-(void)buttonPanned:(id)arg1 ;
-(void)shouldDelete;
-(void)swippedRight;
-(void)swippedLeft;
-(void)swipeLeftContinousBegin;
-(void)swipeLeftContinousEnded;
-(void)deleteTimeIntervalChanged:(double)arg1 ;
-(void)panningBegin;
-(void)panningEnded;
-(void)panningUp;
-(void)panningDown;
-(void)handleDeleteTimerTick;
-(void)buttonWillGrow;
-(void)beginHighlightSecondaryLabel;
-(void)endHighlightSecondaryLabel;
-(void)beginHighlightDoubleDownLabel;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(long long)row;
-(void)setTextColor:(UIColor *)arg1 ;
-(UIColor *)textColor;
-(BOOL)animated;
-(void)setAnimated:(BOOL)arg1 ;
-(void)touchDown;
-(UIColor *)normalBackgroundColor;
-(void)buttonPressed;
-(void)setRow:(long long)arg1 ;
@end

