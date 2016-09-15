/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:24:09 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@interface FBSDKServerConfigurationManager : NSObject
+(id)cachedServerConfiguration;
+(id)requestToLoadServerConfiguration:(id)arg1 ;
+(void)processLoadRequestResponse:(id)arg1 error:(id)arg2 appID:(id)arg3 ;
+(void)loadServerConfigurationWithCompletionBlock:(/*^block*/id)arg1 ;
+(id)_defaultServerConfigurationForAppID:(id)arg1 ;
+(BOOL)_serverConfigurationTimestampIsValid:(id)arg1 ;
+(/*^block*/id)_wrapperBlockForLoadBlock:(/*^block*/id)arg1 ;
+(void)_didProcessConfigurationFromNetwork:(id)arg1 appID:(id)arg2 error:(id)arg3 ;
+(id)_parseDialogConfigurations:(id)arg1 ;
+(void)initialize;
+(void)clearCache;
-(id)init;
@end

