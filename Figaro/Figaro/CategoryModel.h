//
//  Category.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"
#import "SubcategoryModel.h"

@protocol CategoryModel

@end


@interface CategoryModel : BaseJsonModel

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSMutableArray<SubcategoryModel> *subcategories;

@end
