/*
* This header is generated by classdump-dyld 1.0
* on Sunday, September 4, 2016 at 9:15:10 PM Indochina Time
* Operating System: Version 9.3.3 (Build 13G34)
* Image Source: /private/var/containers/Bundle/Application/EEBBBFB8-1B43-4927-9199-92E29DCE0E94/KhmerKeyboard.app/PlugIns/com.vanna.KhmerKeyboard.Keyboard.appex/com.vanna.KhmerKeyboard.Keyboard
* classdump-dyld is licensed under GPLv3, Copyright © 2013-2016 by Elias Limneos.
*/

#import <UIKit/UICollectionViewController.h>

@class NSString;

@interface com_vanna_KhmerKeyboard_Keyboard.EmojiCollectionViewController : UICollectionViewController {

	 delegate;
	 emojiClickEvent;
	 categoryScrollEvent;
	 reuseIdentifier;
	 recenltyEmojiManager;
	 currentVisibleSection;

}

@property (copy,nonatomic) NSString * reuseIdentifier; 
@property (assign,nonatomic) long long currentVisibleSection; 
-(long long)currentVisibleSection;
-(void)setCurrentVisibleSection:(long long)arg1 ;
-(id)initWithCoder:(id)arg1 ;
-(long long)collectionView:(id)arg1 numberOfItemsInSection:(long long)arg2 ;
-(id)collectionView:(id)arg1 cellForItemAtIndexPath:(id)arg2 ;
-(long long)numberOfSectionsInCollectionView:(id)arg1 ;
-(void)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2 ;
-(void)collectionView:(id)arg1 willDisplayCell:(id)arg2 forItemAtIndexPath:(id)arg3 ;
-(id)initWithNibName:(id)arg1 bundle:(id)arg2 ;
-(NSString *)reuseIdentifier;
-(void)setReuseIdentifier:(NSString *)arg1 ;
-(void)viewDidLoad;
-(id)initWithCollectionViewLayout:(id)arg1 ;
@end

