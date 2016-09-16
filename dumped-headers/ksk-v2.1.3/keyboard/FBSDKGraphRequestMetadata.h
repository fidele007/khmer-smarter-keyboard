/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class FBSDKGraphRequest, NSDictionary;

@interface FBSDKGraphRequestMetadata : NSObject {

	FBSDKGraphRequest* _request;
	/*^block*/id _completionHandler;
	NSDictionary* _batchParameters;

}

@property (nonatomic,retain) FBSDKGraphRequest * request;               //@synthesize request=_request - In the implementation block
@property (nonatomic,copy) id completionHandler;                        //@synthesize completionHandler=_completionHandler - In the implementation block
@property (nonatomic,copy) NSDictionary * batchParameters;              //@synthesize batchParameters=_batchParameters - In the implementation block
-(id)initWithRequest:(id)arg1 completionHandler:(/*^block*/id)arg2 batchParameters:(id)arg3 ;
-(NSDictionary *)batchParameters;
-(void)invokeCompletionHandlerForConnection:(id)arg1 withResults:(id)arg2 error:(id)arg3 ;
-(void)setBatchParameters:(NSDictionary *)arg1 ;
-(id)init;
-(id)description;
-(FBSDKGraphRequest *)request;
-(id)completionHandler;
-(void)setCompletionHandler:(id)arg1 ;
-(void)setRequest:(FBSDKGraphRequest *)arg1 ;
@end
