/*
* This header is generated by classdump-dyld 1.0
* on Wednesday, August 31, 2016 at 11:31:58 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSString;

@interface FBSDKTimeSpentData : NSObject {

	BOOL _isCurrentlyLoaded;
	BOOL _shouldLogActivateEvent;
	BOOL _shouldLogDeactivateEvent;
	long long _secondsSpentInCurrentSession;
	long long _timeSinceLastSuspend;
	int _numInterruptionsInCurrentSession;
	long long _lastRestoreTime;
	long long _lastSuspendTime;
	NSString* _sessionID;

}
+(void)setSourceApplication:(id)arg1 isFromAppLink:(BOOL)arg2 ;
+(void)setSourceApplication:(id)arg1 openURL:(id)arg2 ;
+(void)registerAutoResetSourceApplication;
+(id)getSourceApplication;
+(void)resetSourceApplication;
+(void)suspend;
+(id)singleton;
+(void)restore:(BOOL)arg1 ;
-(void)instanceSuspend;
-(void)instanceRestore:(BOOL)arg1 ;
-(id)appEventsParametersForDeactivate;
-(id)appEventsParametersForActivate;
@end
