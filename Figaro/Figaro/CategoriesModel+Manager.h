//
//  CotegoriesModel+Manager.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "CategoriesModel.h"
#import "Base.h"

@interface CategoriesModel (Manager)

+ (void)get:(BaseCompletionHandler)completion;

@end
