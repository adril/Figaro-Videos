//
//  CategoryCollectionViewCell.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseCollectionViewCell.h"
#import "VideosTableView.h"

@interface CategoryCollectionViewCell : BaseCollectionViewCell

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;

- (void)reset;

@end
