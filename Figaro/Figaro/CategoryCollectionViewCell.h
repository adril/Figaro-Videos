//
//  CategoryCollectionViewCell.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "VideosTableView.h"

@interface CategoryCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;

- (void)reset;

@end
