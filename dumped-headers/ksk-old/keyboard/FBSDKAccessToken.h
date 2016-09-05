/*
* This header is generated by classdump-dyld 1.0
* on Thursday, August 25, 2016 at 4:47:06 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <com.vanna.KhmerKeyboard.Keyboard/FBSDKCopying.h>
#import <libobjc.A.dylib/NSSecureCoding.h>

@class NSString, NSSet, NSDate;

@interface FBSDKAccessToken : NSObject <FBSDKCopying, NSSecureCoding> {

	NSString* _appID;
	NSSet* _declinedPermissions;
	NSDate* _expirationDate;
	NSSet* _permissions;
	NSDate* _refreshDate;
	NSString* _tokenString;
	NSString* _userID;

}

@property (nonatomic,copy,readonly) NSString * appID;                         //@synthesize appID=_appID - In the implementation block
@property (nonatomic,copy,readonly) NSSet * declinedPermissions;              //@synthesize declinedPermissions=_declinedPermissions - In the implementation block
@property (nonatomic,copy,readonly) NSDate * expirationDate;                  //@synthesize expirationDate=_expirationDate - In the implementation block
@property (nonatomic,copy,readonly) NSSet * permissions;                      //@synthesize permissions=_permissions - In the implementation block
@property (nonatomic,copy,readonly) NSDate * refreshDate;                     //@synthesize refreshDate=_refreshDate - In the implementation block
@property (nonatomic,copy,readonly) NSString * tokenString;                   //@synthesize tokenString=_tokenString - In the implementation block
@property (nonatomic,copy,readonly) NSString * userID;                        //@synthesize userID=_userID - In the implementation block
@property (readonly) unsigned long long hash; 
@property (readonly) Class superclass; 
@property (copy,readonly) NSString * description; 
@property (copy,readonly) NSString * debugDescription; 
+(id)currentAccessToken;
+(void)setCurrentAccessToken:(id)arg1 ;
+(void)refreshCurrentAccessToken:(/*^block*/id)arg1 ;
+(BOOL)supportsSecureCoding;
-(NSSet *)declinedPermissions;
-(id)initWithTokenString:(id)arg1 permissions:(id)arg2 declinedPermissions:(id)arg3 appID:(id)arg4 userID:(id)arg5 expirationDate:(id)arg6 refreshDate:(id)arg7 ;
-(NSDate *)refreshDate;
-(BOOL)isEqualToAccessToken:(id)arg1 ;
-(BOOL)hasGranted:(id)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(void)encodeWithCoder:(id)arg1 ;
-(id)init;
-(BOOL)isEqual:(id)arg1 ;
-(unsigned long long)hash;
-(id)copyWithZone:(NSZone*)arg1 ;
-(NSDate *)expirationDate;
-(NSString *)tokenString;
-(NSSet *)permissions;
-(NSString *)appID;
-(NSString *)userID;
@end

