//
//  BaseCollectionView.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
		[self configure];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		// Initialization code
		[self configure];
	}
	return self;
}
- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self configure];
}

- (void)configure {
	self.delegate = self;
	self.dataSource = self;
	
	self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Nib registration

- (void)registerNibWithIdentifier:(NSString *)identifier {
	UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
	[self registerNib:nib forCellWithReuseIdentifier:identifier];
}

#pragma mark - List Management

- (NSMutableArray *)list {
	if (_list == nil) {
		_list = [[NSMutableArray alloc] init];
	}
	return _list;
}

- (void)setList:(NSMutableArray *)list {
	_list = list;
	
	[self reloadData];
}

- (void)insertItem:(id)object {
	if (object == nil)
		return;
	
	[self.list addObject:object];
	[self reloadData];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
	return [self.list count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
	return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *cell = nil;
	
	if (self.cellForRowAtIndexPathCompletion) {
		id object = [self.list objectAtIndex:indexPath.row];
		
		self.cellForRowAtIndexPathCompletion(object, &cell, indexPath);
	}
	
	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	id object = [self.list objectAtIndex:indexPath.row];
	
	if (self.didSelectItemCompletion) {
		self.didSelectItemCompletion(object);
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	[self performBatchUpdates:^{
		if (self.didScrollViewDidEndDeceleratingCompletion) {
			CGPoint centerPoint = CGPointMake(self.frame.size.width / 2 + scrollView.contentOffset.x, self.frame.size.height / 2 + scrollView.contentOffset.y);
			NSIndexPath *indexPath = [self indexPathForItemAtPoint:centerPoint];
			id object = [self.list objectAtIndex:indexPath.row];
			self.didScrollViewDidEndDeceleratingCompletion(object);
		}
	} completion:nil];
}

- (void)selectItem:(id)item {
	if (self.list == nil || self.list.count == 0)
		return;
	
	NSInteger row = 0;
	for (NSString *itemToCompare in self.list) {
		if ([item isEqual:itemToCompare]) {
			break;
		}
		row++;
	}
	[self selectItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

@end
