/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <libobjc.A.dylib/NSURLConnectionDataDelegate.h>

@protocol FBSDKURLConnectionDelegate;
@class NSURLConnection, NSMutableData, NSURLResponse, NSString;

@interface FBSDKURLConnection : NSObject <NSURLConnectionDataDelegate> {

	id<FBSDKURLConnectionDelegate> _delegate;
	NSURLConnection* _connection;
	NSMutableData* _data;
	/*^block*/id _handler;
	NSURLResponse* _response;
	unsigned long long _requestStartTime;
	unsigned long long _loggerSerialNumber;

}

@property (nonatomic,retain) NSURLConnection * connection;                                //@synthesize connection=_connection - In the implementation block
@property (nonatomic,retain) NSMutableData * data;                                        //@synthesize data=_data - In the implementation block
@property (nonatomic,copy) id handler;                                                    //@synthesize handler=_handler - In the implementation block
@property (nonatomic,retain) NSURLResponse * response;                                    //@synthesize response=_response - In the implementation block
@property (assign,nonatomic) unsigned long long requestStartTime;                         //@synthesize requestStartTime=_requestStartTime - In the implementation block
@property (nonatomic,readonly) unsigned long long loggerSerialNumber;                     //@synthesize loggerSerialNumber=_loggerSerialNumber - In the implementation block
@property (assign,nonatomic,__weak) id<FBSDKURLConnectionDelegate> delegate;              //@synthesize delegate=_delegate - In the implementation block
@property (readonly) unsigned long long hash; 
@property (readonly) Class superclass; 
@property (copy,readonly) NSString * description; 
@property (copy,readonly) NSString * debugDescription; 
-(unsigned long long)loggerSerialNumber;
-(id)initWithRequest:(id)arg1 completionHandler:(/*^block*/id)arg2 ;
-(void)invokeHandler:(/*^block*/id)arg1 error:(id)arg2 response:(id)arg3 responseData:(id)arg4 ;
-(void)logAndInvokeHandler:(/*^block*/id)arg1 error:(id)arg2 ;
-(void)logAndInvokeHandler:(/*^block*/id)arg1 response:(id)arg2 responseData:(id)arg3 ;
-(void)setRequestStartTime:(unsigned long long)arg1 ;
-(void)cancel;
-(void)setDelegate:(id<FBSDKURLConnectionDelegate>)arg1 ;
-(id)init;
-(id<FBSDKURLConnectionDelegate>)delegate;
-(NSMutableData *)data;
-(void)setData:(NSMutableData *)arg1 ;
-(void)start;
-(NSURLResponse *)response;
-(id)handler;
-(void)setHandler:(id)arg1 ;
-(void)connection:(id)arg1 didFailWithError:(id)arg2 ;
-(void)connection:(id)arg1 didReceiveData:(id)arg2 ;
-(void)connectionDidFinishLoading:(id)arg1 ;
-(void)connection:(id)arg1 didReceiveResponse:(id)arg2 ;
-(NSURLConnection *)connection;
-(void)setConnection:(NSURLConnection *)arg1 ;
-(id)connection:(id)arg1 willSendRequest:(id)arg2 redirectResponse:(id)arg3 ;
-(void)connection:(id)arg1 didSendBodyData:(long long)arg2 totalBytesWritten:(long long)arg3 totalBytesExpectedToWrite:(long long)arg4 ;
-(void)setResponse:(NSURLResponse *)arg1 ;
-(unsigned long long)requestStartTime;
-(void)logMessage:(id)arg1 ;
-(void)setDelegateQueue:(id)arg1 ;
@end

