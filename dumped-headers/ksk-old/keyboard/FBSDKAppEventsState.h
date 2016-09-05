/*
* This header is generated by classdump-dyld 1.0
* on Thursday, August 25, 2016 at 4:47:06 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <libobjc.A.dylib/NSCopying.h>
#import <libobjc.A.dylib/NSSecureCoding.h>

@class NSMutableArray, NSString, NSArray;

@interface FBSDKAppEventsState : NSObject <NSCopying, NSSecureCoding> {

	NSMutableArray* _mutableEvents;
	unsigned long long _numSkipped;
	NSString* _tokenString;
	NSString* _appID;

}

@property (copy,readonly) NSArray * events; 
@property (readonly) unsigned long long numSkipped;              //@synthesize numSkipped=_numSkipped - In the implementation block
@property (copy,readonly) NSString * tokenString;                //@synthesize tokenString=_tokenString - In the implementation block
@property (copy,readonly) NSString * appID;                      //@synthesize appID=_appID - In the implementation block
+(BOOL)supportsSecureCoding;
-(id)initWithToken:(id)arg1 appID:(id)arg2 ;
-(BOOL)isCompatibleWithTokenString:(id)arg1 appID:(id)arg2 ;
-(void)addEventsFromAppEventState:(id)arg1 ;
-(void)addEvent:(id)arg1 isImplicit:(BOOL)arg2 ;
-(BOOL)areAllEventsImplicit;
-(BOOL)isCompatibleWithAppEventsState:(id)arg1 ;
-(id)JSONStringForEvents:(BOOL)arg1 ;
-(unsigned long long)numSkipped;
-(id)initWithCoder:(id)arg1 ;
-(void)encodeWithCoder:(id)arg1 ;
-(id)init;
-(id)copyWithZone:(NSZone*)arg1 ;
-(NSString *)tokenString;
-(NSArray *)events;
-(NSString *)appID;
@end

