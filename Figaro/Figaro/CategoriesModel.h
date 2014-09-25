//
//  CategoriesModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"
#import "CategoryModel.h"

@interface CategoriesModel : BaseJsonModel

@property (nonatomic, strong) NSMutableArray<CategoryModel> *categories;

@end
