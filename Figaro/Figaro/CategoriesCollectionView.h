//
//  CategoriesCollectionView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseCollectionView.h"
#import "CategoriesModel.h"

@interface CategoriesCollectionView : BaseCollectionView

@property (nonatomic, strong) CategoriesModel *categories;
@property (nonatomic, strong) BaseCompletionHandler didSelectCategoryCompletion;
@property (nonatomic, strong) BaseCompletionHandler didSelectSubcategoryCompletion;

@property (nonatomic, strong) UIColor *textColor;

@end
