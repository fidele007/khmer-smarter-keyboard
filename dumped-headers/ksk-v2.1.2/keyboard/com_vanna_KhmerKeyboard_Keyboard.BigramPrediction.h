/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <Foundation/NSOperation.h>

@class NSString, _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase, NSSet, NSArray;

@interface com_vanna_KhmerKeyboard_Keyboard.BigramPrediction : NSOperation {

	 gram1;
	 db;
	 userDB;
	 words;
	 wordArray;

}

@property (copy,nonatomic) NSString * gram1; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * db; 
@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * userDB; 
@property (copy,nonatomic) NSSet * words; 
@property (copy,nonatomic) NSArray * wordArray; 
-(NSString *)gram1;
-(void)setGram1:(NSString *)arg1 ;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)userDB;
-(void)setUserDB:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
-(void)setWordArray:(NSArray *)arg1 ;
-(id)initWithGram1:(id)arg1 db:(id)arg2 userDB:(id)arg3 ;
-(id)init;
-(void)main;
-(void)setWords:(NSSet *)arg1 ;
-(NSSet *)words;
-(NSArray *)wordArray;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)db;
-(void)setDb:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
@end

