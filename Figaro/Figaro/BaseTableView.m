//
//  BaseTableView.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseTableView.h"

@implementation BaseTableView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self configure];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self configure];
	}
	return self;
}

- (void)configure {
	self.delegate = self;
	self.dataSource = self;
}

#pragma mark - List Management

- (NSMutableArray *)list {
	if (_list == nil) {
		_list = [[NSMutableArray alloc] init];
	}
	return _list;
}

- (void)setList:(NSMutableArray *)list {
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.list removeAllObjects];
		_list = list;
		[self reloadSection];
	});
}

- (void)insertList:(NSMutableArray *)list {
	if (list == nil) {
		return;
	}
	
	[self.list addObjectsFromArray:list];
	[self reloadSection];
}

- (void)insertItem:(id)object {
	[self insertItem:object onTop:NO];
}

- (void)insertItem:(id)object onTop:(BOOL)onTop {
	
	NSUInteger insertIndex = 0;
	
	if (onTop == NO)
		insertIndex = [self.list count];
	
	[self.list insertObject:object atIndex:insertIndex];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:insertIndex inSection:0];
	
	[self beginUpdates];
	[self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
	[self endUpdates];
}

#pragma mark - Reload

- (void)reload {
	[self.list removeAllObjects];
	[self reloadSection];
}

- (void)reloadSection {
	[self beginUpdates];
	[self reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
	[self endUpdates];
}

#pragma mark - Nib registration

- (void)registerNibWithIdentifier:(NSString *)identifier {
	
	UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
	[self registerNib:nib forCellReuseIdentifier:identifier];
}

#pragma mark - Cell Configuration

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Default"];
		
	if ([self.baseDelegate respondsToSelector:@selector(cellForRowAtIndexPath:withObject:)]) {
		id object = [self.list objectAtIndex:indexPath.row];
		cell = [self.baseDelegate cellForRowAtIndexPath:indexPath withObject:object];
	} else if (self.cellForRowAtIndexPathCompletion) {
		id object = [self.list objectAtIndex:indexPath.row];
		cell = self.cellForRowAtIndexPathCompletion(object, cell, indexPath);
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (self.didSelectItemCompletion) {
		
		id object = [self.list objectAtIndex:indexPath.row];
		self.didSelectItemCompletion(object);
	}
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (self.willDisplayCellCompletion) {
		id object = [self.list objectAtIndex:indexPath.row];
		self.willDisplayCellCompletion(object, cell, indexPath);
	} else if ([self.baseDelegate respondsToSelector:@selector(willDisplayCellAtIndexPath:withObject:)]) {
		id object = [self.list objectAtIndex:indexPath.row];
		[self.baseDelegate willDisplayCellAtIndexPath:indexPath withObject:object];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.list count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([self.baseDelegate respondsToSelector:@selector(heightForRowAtIndexPath:withObject:)]) {
		id object = [self.list objectAtIndex:indexPath.row];
		return [self.baseDelegate heightForRowAtIndexPath:indexPath withObject:object];
	}
	return self.rowHeight;
}

#pragma mark - TableView tools

- (NSIndexPath *)indexPathForObject:(id)object {
	NSUInteger index = [self.list indexOfObject:object];
	
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
	
	return indexPath;
}

- (void)scrollToObject:(id)object {
	NSIndexPath *indexPath = [self indexPathForObject:object];
	[self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
}


@end
