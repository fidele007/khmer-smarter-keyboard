/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <UIKit/UIView.h>

@class NSArray, _TtC32com_vanna_KhmerKeyboard_Keyboard12ThemeChooser, UIScrollView;

@interface com_vanna_KhmerKeyboard_Keyboard.GlobePopupView : UIView {

	 languages;
	 userRequestedEvent;
	 themeChooser;
	 scrollView;

}

@property (readonly,nonatomic) NSArray * languages; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard12ThemeChooser * themeChooser; 
@property (retain,nonatomic) UIScrollView * scrollView; 
-(_TtC32com_vanna_KhmerKeyboard_Keyboard12ThemeChooser *)themeChooser;
-(void)setThemeChooser:(_TtC32com_vanna_KhmerKeyboard_Keyboard12ThemeChooser *)arg1 ;
-(void)buttonPressedUp:(id)arg1 ;
-(id)initWithFrame:(CGRect)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)setScrollView:(UIScrollView *)arg1 ;
-(UIScrollView *)scrollView;
-(void)buttonPressed:(id)arg1 ;
-(NSArray *)languages;
@end

