/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/com.vanna.KhmerKeyboard.Keyboard-Structs.h>
#import <com.vanna.KhmerKeyboard.Keyboard/FBSDKCopying.h>
#import <libobjc.A.dylib/NSSecureCoding.h>

@class NSArray, NSString, NSURL;

@interface FBSDKDialogConfiguration : NSObject <FBSDKCopying, NSSecureCoding> {

	NSArray* _appVersions;
	NSString* _name;
	NSURL* _URL;

}

@property (nonatomic,copy,readonly) NSArray * appVersions;              //@synthesize appVersions=_appVersions - In the implementation block
@property (nonatomic,copy,readonly) NSString * name;                    //@synthesize name=_name - In the implementation block
@property (nonatomic,copy,readonly) NSURL * URL;                        //@synthesize URL=_URL - In the implementation block
@property (readonly) unsigned long long hash; 
@property (readonly) Class superclass; 
@property (copy,readonly) NSString * description; 
@property (copy,readonly) NSString * debugDescription; 
+(BOOL)supportsSecureCoding;
-(id)initWithName:(id)arg1 URL:(id)arg2 appVersions:(id)arg3 ;
-(NSArray *)appVersions;
-(id)initWithCoder:(id)arg1 ;
-(void)encodeWithCoder:(id)arg1 ;
-(id)init;
-(NSString *)name;
-(id)copyWithZone:(NSZone*)arg1 ;
-(NSURL *)URL;
@end

