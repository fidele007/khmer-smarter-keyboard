/*
* This header is generated by classdump-dyld 1.0
* on Wednesday, August 31, 2016 at 11:31:58 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <UIKit/UIViewController.h>

@protocol FBSDKContainerViewControllerDelegate;
@interface FBSDKContainerViewController : UIViewController {

	id<FBSDKContainerViewControllerDelegate> _delegate;

}

@property (assign,nonatomic,__weak) id<FBSDKContainerViewControllerDelegate> delegate;              //@synthesize delegate=_delegate - In the implementation block
-(void)displayChildController:(id)arg1 ;
-(void)setDelegate:(id<FBSDKContainerViewControllerDelegate>)arg1 ;
-(id<FBSDKContainerViewControllerDelegate>)delegate;
-(void)viewDidDisappear:(BOOL)arg1 ;
@end

