/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <UIKit/UIView.h>

@class UIButton, _TtC32com_vanna_KhmerKeyboard_Keyboard33AdvertisementViewControllerDetail;

@interface com_vanna_KhmerKeyboard_Keyboard.AdvertisementView : UIView {

	 button;
	 logoButton;
	 keyboardDelegate;
	 adsViewControllerDetail;

}

@property (retain,nonatomic) UIButton * button; 
@property (retain,nonatomic) UIButton * logoButton; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard33AdvertisementViewControllerDetail * adsViewControllerDetail; 
-(UIButton *)logoButton;
-(void)setLogoButton:(UIButton *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard33AdvertisementViewControllerDetail *)adsViewControllerDetail;
-(void)setAdsViewControllerDetail:(_TtC32com_vanna_KhmerKeyboard_Keyboard33AdvertisementViewControllerDetail *)arg1 ;
-(void)setAd:(id)arg1 logo:(id)arg2 ;
-(void)logoAnimate;
-(void)AdsDetailButtonPress:(id)arg1 ;
-(UIButton *)button;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)animate;
-(void)setButton:(UIButton *)arg1 ;
@end

