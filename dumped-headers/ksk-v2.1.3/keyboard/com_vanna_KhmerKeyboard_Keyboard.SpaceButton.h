/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
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
-(void)handleSpaceBarSwipeUp:(id)arg1 ;
-(void)buttonPanned:(id)arg1 ;
-(UIColor *)themecolor;
-(void)setThemecolor:(UIColor *)arg1 ;
-(void)setLeftCharacter:(NSString *)arg1 ;
-(void)setRightCharacter:(NSString *)arg1 ;
-(void)setRightLabel:(UILabel *)arg1 ;
-(void)setCenterLabel:(UILabel *)arg1 ;
-(void)updatespacebardarkColor;
-(void)updatespacebarlightColor;
-(void)animateUp:(id)arg1 ;
-(void)scaleDownLabels;
-(UILabel *)centerLabel;
-(void)animateWayUp:(id)arg1 ;
-(NSString *)leftCharacter;
-(NSString *)rightCharacter;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)setOrder:(long long)arg1 ;
-(long long)order;
-(void)handleTap:(id)arg1 ;
-(UILabel *)leftLabel;
-(UILabel *)rightLabel;
-(void)setLeftLabel:(UILabel *)arg1 ;
@end

