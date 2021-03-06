/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSTimer, FBSDKServerConfiguration, FBSDKAppEventsState, NSString;

@interface FBSDKAppEvents : NSObject {

	BOOL _explicitEventsLoggedYet;
	NSTimer* _flushTimer;
	NSTimer* _attributionIDRecheckTimer;
	FBSDKServerConfiguration* _serverConfiguration;
	FBSDKAppEventsState* _appEventsState;
	BOOL _disableTimer;
	unsigned long long _flushBehavior;
	NSString* _pushNotificationsDeviceTokenString;

}

@property (assign,nonatomic) unsigned long long flushBehavior;                         //@synthesize flushBehavior=_flushBehavior - In the implementation block
@property (assign,nonatomic) BOOL disableTimer;                                        //@synthesize disableTimer=_disableTimer - In the implementation block
@property (nonatomic,copy) NSString * pushNotificationsDeviceTokenString;              //@synthesize pushNotificationsDeviceTokenString=_pushNotificationsDeviceTokenString - In the implementation block
+(void)logEvent:(id)arg1 valueToSum:(double)arg2 parameters:(id)arg3 ;
+(unsigned long long)flushBehavior;
+(void)logEvent:(id)arg1 parameters:(id)arg2 ;
+(id)loggingOverrideAppID;
+(void)logImplicitEvent:(id)arg1 valueToSum:(id)arg2 parameters:(id)arg3 accessToken:(id)arg4 ;
+(void)logEvent:(id)arg1 valueToSum:(id)arg2 parameters:(id)arg3 accessToken:(id)arg4 ;
+(void)logPurchase:(double)arg1 currency:(id)arg2 parameters:(id)arg3 ;
+(void)logPurchase:(double)arg1 currency:(id)arg2 parameters:(id)arg3 accessToken:(id)arg4 ;
+(void)logPushNotificationOpen:(id)arg1 action:(id)arg2 ;
+(void)setFlushBehavior:(unsigned long long)arg1 ;
+(void)logEvent:(id)arg1 valueToSum:(double)arg2 ;
+(void)logPurchase:(double)arg1 currency:(id)arg2 ;
+(void)logPushNotificationOpen:(id)arg1 ;
+(void)activateApp;
+(void)setPushNotificationsDeviceToken:(id)arg1 ;
+(void)setLoggingOverrideAppID:(id)arg1 ;
+(id)requestForCustomAudienceThirdPartyIDWithAccessToken:(id)arg1 ;
+(void)flush;
+(void)initialize;
+(void)logEvent:(id)arg1 ;
+(id)singleton;
-(unsigned long long)flushBehavior;
-(void)flushForReason:(unsigned long long)arg1 ;
-(void)flushTimerFired:(id)arg1 ;
-(void)appSettingsFetchStateResetTimerFired:(id)arg1 ;
-(void)applicationMovingFromActiveStateOrTerminating;
-(void)instanceLogEvent:(id)arg1 valueToSum:(id)arg2 parameters:(id)arg3 isImplicitlyLogged:(BOOL)arg4 accessToken:(id)arg5 ;
-(void)publishInstall;
-(void)fetchServerConfiguration:(/*^block*/id)arg1 ;
-(void)setPushNotificationsDeviceTokenString:(NSString *)arg1 ;
-(void)setFlushBehavior:(unsigned long long)arg1 ;
-(void)flushOnMainQueue:(id)arg1 forReason:(unsigned long long)arg2 ;
-(void)checkPersistedEvents;
-(NSString *)pushNotificationsDeviceTokenString;
-(void)handleActivitiesPostCompletion:(id)arg1 loggingEntry:(id)arg2 appEventsState:(id)arg3 ;
-(BOOL)disableTimer;
-(void)setDisableTimer:(BOOL)arg1 ;
-(void)dealloc;
-(id)init;
-(void)applicationDidBecomeActive;
-(id)appID;
@end

