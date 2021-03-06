/*
* This header is generated by classdump-dyld 1.0
* on Monday, September 5, 2016 at 8:26:25 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class ACAccountStore, ACAccountType;

@interface FBSDKSystemAccountStoreAdapter : NSObject {

	ACAccountStore* _accountStore;
	ACAccountType* _accountType;
	BOOL _forceBlockingRenew;

}

@property (nonatomic,retain,readonly) ACAccountStore * accountStore; 
@property (assign,nonatomic) BOOL forceBlockingRenew;                             //@synthesize forceBlockingRenew=_forceBlockingRenew - In the implementation block
@property (nonatomic,readonly) ACAccountType * accountType; 
+(id)sharedInstance;
+(void)initialize;
+(void)setSharedInstance:(id)arg1 ;
-(BOOL)forceBlockingRenew;
-(void)setForceBlockingRenew:(BOOL)arg1 ;
-(void)requestAccessToFacebookAccountStore:(id)arg1 retrying:(BOOL)arg2 handler:(/*^block*/id)arg3 ;
-(void)renewSystemAuthorization:(/*^block*/id)arg1 ;
-(id)accessTokenString;
-(void)requestAccessToFacebookAccountStore:(id)arg1 defaultAudience:(id)arg2 isReauthorize:(BOOL)arg3 appID:(id)arg4 handler:(/*^block*/id)arg5 ;
-(id)init;
-(ACAccountStore *)accountStore;
-(ACAccountType *)accountType;
@end

