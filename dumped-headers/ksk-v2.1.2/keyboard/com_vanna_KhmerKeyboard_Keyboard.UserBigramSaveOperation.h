/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <Foundation/NSOperation.h>

@class _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase, NSString;

@interface com_vanna_KhmerKeyboard_Keyboard.UserBigramSaveOperation : NSOperation {

	 db;
	 term1;
	 term2;
	 status;

}

@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * db; 
@property (copy,nonatomic) NSString * term1; 
@property (copy,nonatomic) NSString * term2; 
-(NSString *)term1;
-(void)setTerm1:(NSString *)arg1 ;
-(NSString *)term2;
-(void)setTerm2:(NSString *)arg1 ;
-(id)initWithTerm1:(id)arg1 term2:(id)arg2 db:(id)arg3 ;
-(id)init;
-(void)main;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)db;
-(void)setDb:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
@end
