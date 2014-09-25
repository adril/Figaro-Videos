//
//  CategoriesCollectionView.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "CategoriesCollectionView.h"
#import "CategoryCollectionViewCell.h"

static NSString *CategoryCollectionViewCellIdentifier = @"CategoryCollectionViewCell";

@implementation CategoriesCollectionView

- (void)awakeFromNib {
	[self registerNibWithIdentifier:CategoryCollectionViewCellIdentifier];
	[super awakeFromNib];

	[self configure];
}

- (void)configure {
	[super configure];
	__weak __typeof(self)weakSelf = self;
	
	self.cellForRowAtIndexPathCompletion = ^(id object, UICollectionViewCell **cell, NSIndexPath *indexPath) {
		if ([object isKindOfClass:[CategoryModel class]]) {
			*cell = [weakSelf dequeueReusableCellWithReuseIdentifier:CategoryCollectionViewCellIdentifier forIndexPath:indexPath];
			
			CategoryCollectionViewCell *categoryCell = (CategoryCollectionViewCell *)*cell;
			CategoryModel *category = object;
			categoryCell.category = category.category;
			categoryCell.textColor = weakSelf.textColor;
			categoryCell.font = [UIFont titleFont];
			categoryCell.backgroundColor = [UIColor clearColor];
		} else if ([object isKindOfClass:[SubcategoryModel class]]) {

			*cell = [weakSelf dequeueReusableCellWithReuseIdentifier:CategoryCollectionViewCellIdentifier forIndexPath:indexPath];
			
			CategoryCollectionViewCell *categoryCell = (CategoryCollectionViewCell *)*cell;
			SubcategoryModel *subcategory = object;
			categoryCell.category = subcategory.name;
			categoryCell.textColor = weakSelf.textColor;
			categoryCell.font = [UIFont subtitleFont];
			categoryCell.backgroundColor = [UIColor clearColor];
		}
	};
	
	self.didSelectItemCompletion = ^(id object) {
		if ([object isKindOfClass:[CategoryModel class]]) {
			
		}
		
	};
	
	self.didScrollViewDidEndDeceleratingCompletion = ^(id object) {
		if ([object isKindOfClass:[CategoryModel class]]) {
//			CategoryModel *category = object;
			//TODO: call block
			if (weakSelf.didSelectCategoryCompletion) {
				weakSelf.didSelectCategoryCompletion(object);
			}
		} else if ([object isKindOfClass:[SubcategoryModel class]]) {
			if (weakSelf.didSelectSubcategoryCompletion) {
				weakSelf.didSelectSubcategoryCompletion(object);
			}
			
		}
		
	};
}

#pragma mark - Custon getters & setters

- (void)setCategories:(CategoriesModel *)categories {
	_categories = categories;
	if (categories) {
		self.list = categories.categories;
	}
}

- (UIColor *)textColor {
	if (_textColor == nil) {
		_textColor = [UIColor fontColor];
	}
	return _textColor;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
	
	return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

@end