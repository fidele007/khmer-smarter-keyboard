/*
* This header is generated by classdump-dyld 1.0
* on Thursday, September 15, 2016 at 5:16:33 PM Central European Summer Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/9A6F22DF-17D7-49A9-A081-D16D43AD007A/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <Foundation/NSOperation.h>

@class NSString, _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase, NSSet;

@interface com_vanna_KhmerKeyboard_Keyboard.UnigramPrediction : NSOperation {

	 query;
	 db;
	 userDb;
	 words;
	 userWordArrayScore;
	 generalWordArrayScore;

}

@property (copy,nonatomic) NSString * query; 
@property (assign,__weak,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * db; 
@property (assign,__weak,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * userDb; 
@property (copy,nonatomic) NSSet * words; 
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)userDb;
-(void)setUserDb:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
-(id)initWithQuery:(id)arg1 db:(id)arg2 userDb:(id)arg3 ;
-(id)init;
-(NSString *)query;
-(void)setQuery:(NSString *)arg1 ;
-(void)main;
-(void)setWords:(NSSet *)arg1 ;
-(NSSet *)words;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)db;
-(void)setDb:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
@end

