//
//  BaseTableViewCell.m
//  Figaro
//
//  Created by Adrien Guffens on 30/09/14.
//
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self configure];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure {
	
}

@end
