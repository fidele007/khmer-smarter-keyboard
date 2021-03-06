/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:24:09 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@interface FBSDKAppEventsUtility : NSObject
+(id)persistenceFilePath:(id)arg1 ;
+(long long)unixTimeNow;
+(void)ensureOnMainThread:(id)arg1 className:(id)arg2 ;
+(id)attributionID;
+(id)advertiserID;
+(id)anonymousID;
+(unsigned long long)advertisingTrackingStatus;
+(id)retrievePersistedAnonymousID;
+(void)persistAnonymousID:(id)arg1 ;
+(void)logAndNotify:(id)arg1 allowLogAsDeveloperError:(BOOL)arg2 ;
+(BOOL)matchString:(id)arg1 firstCharacterSet:(id)arg2 restOfStringCharacterSet:(id)arg3 ;
+(BOOL)regexValidateIdentifier:(id)arg1 ;
+(void)logAndNotify:(id)arg1 ;
+(id)activityParametersDictionaryForEvent:(id)arg1 implicitEventsOnly:(BOOL)arg2 shouldAccessAdvertisingID:(BOOL)arg3 ;
+(void)clearLibraryFiles;
+(id)flushReasonToString:(unsigned long long)arg1 ;
+(BOOL)validateIdentifier:(id)arg1 ;
+(id)tokenStringToUseFor:(id)arg1 ;
-(id)init;
@end

