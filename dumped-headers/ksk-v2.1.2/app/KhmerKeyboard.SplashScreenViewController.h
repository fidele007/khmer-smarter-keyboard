/*
* This header is generated by classdump-dyld 1.0
* on Monday, September 5, 2016 at 8:26:25 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <UIKit/UIViewController.h>

@class NSTimer, UILabel;

@interface KhmerKeyboard.SplashScreenViewController : UIViewController {

	 TIME_TO_CLOSE;
	 remainingTime;
	 closeTimer;
	 secondLabel;

}

@property (assign,nonatomic) long long TIME_TO_CLOSE; 
@property (retain,nonatomic) NSTimer * closeTimer; 
@property (assign,__weak,nonatomic) UILabel * secondLabel; 
-(long long)TIME_TO_CLOSE;
-(void)setTIME_TO_CLOSE:(long long)arg1 ;
-(NSTimer *)closeTimer;
-(void)setCloseTimer:(NSTimer *)arg1 ;
-(void)handleCloseTimerTick:(id)arg1 ;
-(void)buttonCambodiaAction:(id)arg1 ;
-(void)buttonSabayAction:(id)arg1 ;
-(void)buttonMajorAction:(id)arg1 ;
-(void)buttonEzecomeAction:(id)arg1 ;
-(void)buttonWing:(id)arg1 ;
-(void)buttonUSAIDActioin:(id)arg1 ;
-(void)buttonCellcardAction:(id)arg1 ;
-(void)buttonMyTEBAction:(id)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)didReceiveMemoryWarning;
-(id)initWithNibName:(id)arg1 bundle:(id)arg2 ;
-(void)viewDidLoad;
-(void)viewDidAppear:(BOOL)arg1 ;
-(void)viewWillDisappear:(BOOL)arg1 ;
-(void)setSecondLabel:(UILabel *)arg1 ;
-(UILabel *)secondLabel;
@end

