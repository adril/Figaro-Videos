//
//  CategoryCollectionViewCell.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "CategoryCollectionViewCell.h"
#import "BaseLabel.h"

@interface CategoryCollectionViewCell ()

@property (strong, nonatomic) IBOutlet BaseLabel *categoryLabel;

@end

@implementation CategoryCollectionViewCell

- (void)configure {
	[super configure];
	self.categoryLabel.font = [UIFont titleFont];
}

- (void)setTextColor:(UIColor *)textColor {
	_textColor = textColor;
	if (textColor) {
		self.categoryLabel.textColor = textColor;
	}
}

- (void)setFont:(UIFont *)font {
	_font = font;
	if (font) {
		self.categoryLabel.font = font;
	}
}

- (void)setCategory:(NSString *)category {
	_category = category;
	if (category) {
		self.categoryLabel.text = category;
	}
}

- (void)reset {
	self.categoryLabel.text = @"";
}

@end
