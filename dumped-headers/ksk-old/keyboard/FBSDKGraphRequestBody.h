/*
* This header is generated by classdump-dyld 1.0
* on Thursday, August 25, 2016 at 4:47:06 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/A4832F78-521A-4050-AC12-690EABD61C51/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class NSMutableData, NSData;

@interface FBSDKGraphRequestBody : NSObject {

	NSMutableData* _data;

}

@property (nonatomic,retain,readonly) NSData * data; 
+(id)mimeContentType;
-(void)appendUTF8:(id)arg1 ;
-(void)_appendWithKey:(id)arg1 filename:(id)arg2 contentType:(id)arg3 contentBlock:(/*^block*/id)arg4 ;
-(void)appendWithKey:(id)arg1 formValue:(id)arg2 logger:(id)arg3 ;
-(void)appendWithKey:(id)arg1 imageValue:(id)arg2 logger:(id)arg3 ;
-(void)appendWithKey:(id)arg1 dataValue:(id)arg2 logger:(id)arg3 ;
-(void)appendWithKey:(id)arg1 dataAttachmentValue:(id)arg2 logger:(id)arg3 ;
-(id)init;
-(NSData *)data;
@end

