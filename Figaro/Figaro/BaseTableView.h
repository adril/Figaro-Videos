//
//  BaseTableView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "Base.h"

typedef void (^BaseTableViewCellCompletionHandler)(id object, UITableViewCell **cell, NSIndexPath *indexPath);

@interface BaseTableView : UITableView <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray *_list;
}

@property (nonatomic, strong) NSMutableArray *list;

@property (nonatomic, strong) BaseCompletionHandler didSelectItemCompletion;
@property (nonatomic, strong) BaseTableViewCellCompletionHandler cellForRowAtIndexPathCompletion;
@property (nonatomic, strong) BaseTableViewCellCompletionHandler willDisplayCellCompletion;

//@property (nonatomic, strong) BaseCompletionHandler pullToRefreshCompletion;

- (void)registerNibWithIdentifier:(NSString *)identifier;
//- (void)disablePullToRefresh;
//- (void)stopRefreshAnimation;
//- (void)startRefreshAnimation;

- (void)insertList:(NSMutableArray *)list;
- (void)insertItem:(id)object;
- (void)insertItem:(id)object onTop:(BOOL)onTop;

- (NSIndexPath *)indexPathForObject:(id)object;

- (void)scrollToObject:(id)object;

- (void)configure;

@end
