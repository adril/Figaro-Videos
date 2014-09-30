//
//  BaseTableView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "Base.h"

typedef UITableViewCell* (^BaseTableViewCellCompletionHandler)(id object, UITableViewCell *cell, NSIndexPath *indexPath);

@protocol BaseTableViewDelegate <NSObject>
@optional
- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
- (void)willDisplayCellAtIndexPath:(NSIndexPath *)indexPath withObject:(id)object;
@end

@interface BaseTableView : UITableView <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray *_list;
}

@property (nonatomic, strong) NSMutableArray *list;

//INFO: you have the choice to use delegate or block
@property (nonatomic, strong) id<BaseTableViewDelegate> baseDelegate;

@property (nonatomic, strong) BaseCompletionHandler didSelectItemCompletion;
@property (nonatomic, strong) BaseTableViewCellCompletionHandler cellForRowAtIndexPathCompletion;
@property (nonatomic, strong) BaseTableViewCellCompletionHandler willDisplayCellCompletion;

- (void)registerNibWithIdentifier:(NSString *)identifier;

- (void)insertList:(NSMutableArray *)list;
- (void)insertItem:(id)object;
- (void)insertItem:(id)object onTop:(BOOL)onTop;

- (NSIndexPath *)indexPathForObject:(id)object;

- (void)scrollToObject:(id)object;

- (void)configure;

@end
