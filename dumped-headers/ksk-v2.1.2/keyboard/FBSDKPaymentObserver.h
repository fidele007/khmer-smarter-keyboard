/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <com.vanna.KhmerKeyboard.Keyboard/SKPaymentTransactionObserver.h>

@class NSString;

@interface FBSDKPaymentObserver : NSObject <SKPaymentTransactionObserver> {

	BOOL _observingTransactions;

}

@property (readonly) unsigned long long hash; 
@property (readonly) Class superclass; 
@property (copy,readonly) NSString * description; 
@property (copy,readonly) NSString * debugDescription; 
+(void)startObservingTransactions;
+(void)stopObservingTransactions;
+(id)singleton;
-(void)startObservingTransactions;
-(void)stopObservingTransactions;
-(void)handleTransaction:(id)arg1 ;
-(id)init;
-(void)paymentQueue:(id)arg1 updatedTransactions:(id)arg2 ;
@end

