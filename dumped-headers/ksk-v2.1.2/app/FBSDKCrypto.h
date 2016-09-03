/*
* This header is generated by classdump-dyld 1.0
* on Monday, September 5, 2016 at 8:26:25 AM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/KhmerKeyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSData;

@interface FBSDKCrypto : NSObject {

	NSData* _encryptionKeyData;
	NSData* _macKeyData;

}
+(id)randomBytes:(unsigned long long)arg1 ;
+(id)makeMasterKey;
+(id)randomString:(unsigned long long)arg1 ;
-(id)_macForIV:(id)arg1 cipherData:(id)arg2 additionalDataToSign:(id)arg3 ;
-(id)initWithMasterKey:(id)arg1 ;
-(id)initWithEncryptionKey:(id)arg1 macKey:(id)arg2 ;
-(id)encrypt:(id)arg1 additionalDataToSign:(id)arg2 ;
-(id)decrypt:(id)arg1 additionalSignedData:(id)arg2 ;
-(void)dealloc;
@end
