/*
* This header is generated by classdump-dyld 1.0
* on Wednesday, August 31, 2016 at 11:31:58 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSString;

@interface FBSDKKeychainStore : NSObject {

	NSString* _service;
	NSString* _accessGroup;

}

@property (nonatomic,copy,readonly) NSString * service;                  //@synthesize service=_service - In the implementation block
@property (nonatomic,copy,readonly) NSString * accessGroup;              //@synthesize accessGroup=_accessGroup - In the implementation block
-(id)initWithService:(id)arg1 accessGroup:(id)arg2 ;
-(BOOL)setDictionary:(id)arg1 forKey:(id)arg2 accessibility:(void*)arg3 ;
-(BOOL)setData:(id)arg1 forKey:(id)arg2 accessibility:(void*)arg3 ;
-(id)queryForKey:(id)arg1 ;
-(BOOL)setString:(id)arg1 forKey:(id)arg2 accessibility:(void*)arg3 ;
-(id)init;
-(id)stringForKey:(id)arg1 ;
-(id)dictionaryForKey:(id)arg1 ;
-(NSString *)service;
-(NSString *)accessGroup;
-(id)dataForKey:(id)arg1 ;
@end

