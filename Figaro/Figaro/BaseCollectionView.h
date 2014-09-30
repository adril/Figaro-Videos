//
//  BaseCollectionView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "Base.h"

typedef UICollectionViewCell *(^BaseCollectionViewCellCompletionHandler)(id object, UICollectionViewCell *cell, NSIndexPath *indexPath);

@protocol BaseCollectionViewDelegate <NSObject>
@optional
- (UICollectionViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
- (UICollectionViewCell *)didScrollAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

@end

@interface BaseCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate> {
	NSMutableArray *_list;
}

@property (nonatomic, strong) NSMutableArray *list;
//INFO: you have the choice to use delegate or block
@property (nonatomic, strong) id<BaseCollectionViewDelegate> baseDelegate;

@property (nonatomic, strong) BaseCompletionHandler didSelectItemCompletion;
@property (nonatomic, strong) BaseCollectionViewCellCompletionHandler cellForRowAtIndexPathCompletion;
@property (nonatomic, strong) BaseCompletionHandler didScrollAtIndexPathCompletion;

- (void)insertItem:(id)object;
- (void)registerNibWithIdentifier:(NSString *)identifier;
- (void)configure;

- (void)selectItem:(id)item;

@end
