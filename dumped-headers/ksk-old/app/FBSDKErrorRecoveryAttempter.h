/*
* This header is generated by classdump-dyld 1.0
* on Wednesday, August 31, 2016 at 11:31:58 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <KhmerKeyboard/FBSDKErrorRecoveryAttempting.h>

@class NSString;

@interface FBSDKErrorRecoveryAttempter : NSObject <FBSDKErrorRecoveryAttempting>

@property (readonly) unsigned long long hash; 
@property (readonly) Class superclass; 
@property (copy,readonly) NSString * description; 
@property (copy,readonly) NSString * debugDescription; 
+(id)recoveryAttempterFromConfiguration:(id)arg1 ;
-(void)completeRecovery:(BOOL)arg1 delegate:(id)arg2 didRecoverSelector:(SEL)arg3 contextInfo:(void*)arg4 ;
-(void)attemptRecoveryFromError:(id)arg1 optionIndex:(unsigned long long)arg2 delegate:(id)arg3 didRecoverSelector:(SEL)arg4 contextInfo:(void*)arg5 ;
@end

