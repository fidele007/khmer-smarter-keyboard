/*
* This header is generated by classdump-dyld 1.0
* on Monday, September 5, 2016 at 8:26:25 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/KhmerKeyboard
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
