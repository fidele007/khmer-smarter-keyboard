/*
* This header is generated by classdump-dyld 1.0
* on Monday, September 5, 2016 at 8:26:25 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <UIKit/UIViewController.h>

@class NSUserDefaults, UISwitch;

@interface KhmerKeyboard.SettingViewController : UIViewController {

	 mySharedDefaults;
	 onbutton;
	 zeroSpaceSwitcha;

}

@property (retain,nonatomic) NSUserDefaults * mySharedDefaults; 
@property (assign,__weak,nonatomic) UISwitch * onbutton; 
@property (assign,__weak,nonatomic) UISwitch * zeroSpaceSwitcha; 
-(void)animateView:(id)arg1 withAlpha:(double)arg2 duration:(double)arg3 ;
-(void)spaceCursorStateChanged:(id)arg1 ;
-(void)zeroSpaceStateChanged:(id)arg1 ;
-(void)themeSwitchStateChanged:(id)arg1 ;
-(void)themeButtonPressed:(id)arg1 ;
-(void)charThemeButtonPressed:(id)arg1 ;
-(void)viewDidLayoutSubviews;
-(void)setMySharedDefaults:(NSUserDefaults *)arg1 ;
-(UISwitch *)onbutton;
-(void)setOnbutton:(UISwitch *)arg1 ;
-(void)dismissButtonPressed:(id)arg1 ;
-(void)setSpacebutton:(id)arg1 ;
-(void)setZeroSpaceSwitcha:(UISwitch *)arg1 ;
-(UISwitch *)zeroSpaceSwitcha;
-(NSUserDefaults *)mySharedDefaults;
-(id)initWithCoder:(id)arg1 ;
-(void)didReceiveMemoryWarning;
-(id)initWithNibName:(id)arg1 bundle:(id)arg2 ;
-(void)viewDidLoad;
@end

