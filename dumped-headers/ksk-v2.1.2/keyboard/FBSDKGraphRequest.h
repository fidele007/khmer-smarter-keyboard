/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSMutableDictionary, NSString;

@interface FBSDKGraphRequest : NSObject {

	NSMutableDictionary* _parameters;
	NSString* _tokenString;
	NSString* _graphPath;
	NSString* _HTTPMethod;
	NSString* _version;
	unsigned long long _flags;

}

@property (assign,nonatomic) unsigned long long flags;                        //@synthesize flags=_flags - In the implementation block
@property (nonatomic,readonly) NSMutableDictionary * parameters;              //@synthesize parameters=_parameters - In the implementation block
@property (nonatomic,copy,readonly) NSString * tokenString;                   //@synthesize tokenString=_tokenString - In the implementation block
@property (nonatomic,copy,readonly) NSString * graphPath;                     //@synthesize graphPath=_graphPath - In the implementation block
@property (nonatomic,copy,readonly) NSString * HTTPMethod;                    //@synthesize HTTPMethod=_HTTPMethod - In the implementation block
@property (nonatomic,copy,readonly) NSString * version;                       //@synthesize version=_version - In the implementation block
+(BOOL)isAttachment:(id)arg1 ;
+(id)serializeURL:(id)arg1 params:(id)arg2 httpMethod:(id)arg3 ;
+(id)preprocessParams:(id)arg1 ;
+(id)serializeURL:(id)arg1 params:(id)arg2 ;
-(id)initWithGraphPath:(id)arg1 parameters:(id)arg2 flags:(unsigned long long)arg3 ;
-(id)initWithGraphPath:(id)arg1 parameters:(id)arg2 tokenString:(id)arg3 HTTPMethod:(id)arg4 flags:(unsigned long long)arg5 ;
-(id)initWithGraphPath:(id)arg1 parameters:(id)arg2 tokenString:(id)arg3 version:(id)arg4 HTTPMethod:(id)arg5 ;
-(BOOL)isGraphErrorRecoveryDisabled;
-(NSString *)graphPath;
-(id)initWithGraphPath:(id)arg1 parameters:(id)arg2 ;
-(id)initWithGraphPath:(id)arg1 parameters:(id)arg2 HTTPMethod:(id)arg3 ;
-(void)setGraphErrorRecoveryDisabled:(BOOL)arg1 ;
-(id)init;
-(id)description;
-(NSMutableDictionary *)parameters;
-(NSString *)version;
-(id)startWithCompletionHandler:(/*^block*/id)arg1 ;
-(BOOL)hasAttachments;
-(NSString *)tokenString;
-(NSString *)HTTPMethod;
-(void)setFlags:(unsigned long long)arg1 ;
-(unsigned long long)flags;
@end

