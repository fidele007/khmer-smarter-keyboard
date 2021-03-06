/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <UIKit/UIView.h>

@class NSArray;

@interface com_vanna_KhmerKeyboard_Keyboard.CharacterButtonsContainer : UIView {

	 languageProvider;
	 keyWidth;
	 keyHeight;
	 spacing;
	 keyboardHeightManager;
	 keyboardHeight;
	 theme;
	 additionalCharacterButtons.storage;
	 characterButtons.storage;
	 shortCharacterButtonFrames.storage;
	 highCharacterButtonFrames.storage;
	 additionalCharacterButtonFrames.storage;

}

@property (assign,nonatomic) double keyWidth; 
@property (assign,nonatomic) double keyHeight; 
@property (assign,nonatomic) double spacing; 
@property (copy,nonatomic) NSArray * characterButtons; 
-(void)buttonWillGrow:(id)arg1 ;
-(double)keyWidth;
-(void)setKeyWidth:(double)arg1 ;
-(double)keyHeight;
-(void)setKeyHeight:(double)arg1 ;
-(void)setupEvents;
-(NSArray *)characterButtons;
-(void)setCharacterButtons:(NSArray *)arg1 ;
-(void)addButtons2;
-(void)animateToShortMode;
-(void)animateToHighMode;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)setSpacing:(double)arg1 ;
-(double)spacing;
@end

