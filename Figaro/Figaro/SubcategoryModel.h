//
//  SubcategoryModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"

@protocol SubcategoryModel

@end

@interface SubcategoryModel : BaseJsonModel

@property (nonatomic, strong)  NSString *id;
@property (nonatomic, strong)  NSString *name;
@property (nonatomic, strong)  NSNumber *update;
@property (nonatomic, strong)  NSNumber *visible;

@end
