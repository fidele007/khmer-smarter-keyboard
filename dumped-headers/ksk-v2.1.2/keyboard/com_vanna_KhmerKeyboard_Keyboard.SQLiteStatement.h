/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/


@class _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase;

@interface com_vanna_KhmerKeyboard_Keyboard.SQLiteStatement : NSObject {

	 database;
	 cStatement;

}

@property (retain,nonatomic) _TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase * database; 
@property (assign,nonatomic) void* cStatement; 
-(void*)cStatement;
-(void)setCStatement:(void*)arg1 ;
-(id)getStringAt:(long long)arg1 ;
-(long long)getIntAt:(long long)arg1 ;
-(BOOL)getBoolAt:(long long)arg1 ;
-(id)getDateAt:(long long)arg1 ;
-(double)getDoubleAt:(long long)arg1 ;
-(id)getDataAt:(long long)arg1 ;
-(id)init;
-(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)database;
-(id)initWithDatabase:(id)arg1 ;
-(void)setDatabase:(_TtC32com_vanna_KhmerKeyboard_Keyboard14SQLiteDatabase *)arg1 ;
@end
