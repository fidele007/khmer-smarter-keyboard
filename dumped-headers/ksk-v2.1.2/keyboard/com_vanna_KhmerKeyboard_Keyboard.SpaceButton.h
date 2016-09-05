/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <com.vanna.KhmerKeyboard.Keyboard/com_vanna_KhmerKeyboard_Keyboard.KeyButton.h>

@class UIColor, NSString, UILabel;

@interface com_vanna_KhmerKeyboard_Keyboard.SpaceButton : com_vanna_KhmerKeyboard_Keyboard.KeyButton {

	 themecolor;
	 order;
	 leftCharacter;
	 rightCharacter;
	 leftLabel;
	 rightLabel;
	 centerLabel;
	 currentSwipeDirection;
	 keyboard;

}

@property (retain,nonatomic) UIColor * themecolor; 
@property (assign,nonatomic) long long order; 
@property (copy,nonatomic) NSString * leftCharacter; 
@property (copy,nonatomic) NSString * rightCharacter; 
@property (retain,nonatomic) UILabel * leftLabel; 
@property (retain,nonatomic) UILabel * rightLabel; 
@property (retain,nonatomic) UILabel * centerLabel; 
-(void)buttonPanned:(id)arg1 ;
-(UIColor *)themecolor;
-(void)setThemecolor:(UIColor *)arg1 ;
-(NSString *)leftCharacter;
-(void)setLeftCharacter:(NSString *)arg1 ;
-(NSString *)rightCharacter;
-(void)setRightCharacter:(NSString *)arg1 ;
-(void)setRightLabel:(UILabel *)arg1 ;
-(UILabel *)centerLabel;
-(void)setCenterLabel:(UILabel *)arg1 ;
-(void)updatespacebardarkColor;
-(void)updatespacebarlightColor;
-(void)animateUp:(id)arg1 ;
-(void)scaleDownLabels;
-(void)animateWayUp:(id)arg1 ;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)setOrder:(long long)arg1 ;
-(long long)order;
-(void)handleTap:(id)arg1 ;
-(UILabel *)leftLabel;
-(UILabel *)rightLabel;
-(void)setLeftLabel:(UILabel *)arg1 ;
@end

