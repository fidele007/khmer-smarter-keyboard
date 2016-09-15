/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <UIKit/UIView.h>

@class UIView, CAShapeLayer, UILabel;

@interface com_vanna_KhmerKeyboard_Keyboard.InstructionView : UIView {

	 overlayView;
	 maskLayer;
	 label;
	 event;

}

@property (retain,nonatomic) UIView * overlayView; 
@property (retain,nonatomic) CAShapeLayer * maskLayer; 
@property (retain,nonatomic) UILabel * label; 
-(void)tapped;
-(void)move:(CGPoint)arg1 radius:(double)arg2 ;
-(void)swipeDown:(CGPoint)arg1 ;
-(void)swipeLeft:(CGPoint)arg1 ;
-(void)congratulation;
-(void)spaceBarSwipeUp:(CGPoint)arg1 ;
-(void)createOverlay;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(UILabel *)label;
-(void)setLabel:(UILabel *)arg1 ;
-(void)setOverlayView:(UIView *)arg1 ;
-(UIView *)overlayView;
-(CAShapeLayer *)maskLayer;
-(void)setMaskLayer:(CAShapeLayer *)arg1 ;
@end

