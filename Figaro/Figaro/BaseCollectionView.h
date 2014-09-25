//
//  BaseCollectionView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "Base.h"

typedef void (^BaseCollectionViewCellCompletionHandler)(id object, UICollectionViewCell **cell, NSIndexPath *indexPath);

@interface BaseCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate> {
	NSMutableArray *_list;
}

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) BaseCompletionHandler didSelectItemCompletion;
@property (nonatomic, strong) BaseCollectionViewCellCompletionHandler cellForRowAtIndexPathCompletion;
@property (nonatomic, strong) BaseCompletionHandler didScrollViewDidEndDeceleratingCompletion;

- (void)insertItem:(id)object;
- (void)registerNibWithIdentifier:(NSString *)identifier;
- (void)configure;

- (void)selectItem:(id)item;

@end
