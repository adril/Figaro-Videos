//
//  CotegoriesModel+Manager.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "CategoriesModel+Manager.h"
#import "NSDictionary+ClientAPI.h"
#import "ErrorModel.h"

@implementation CategoriesModel (Manager)

+ (void)get:(BaseCompletionHandler)completion {
	NSString *route = [NSString stringWithFormat:@"/videov5_tablet/categories"];
	[@{} getWithRoute:route completion:^(id object) {
		
		DLog(@"object: %@", object);
		if (object == nil || [object isKindOfClass:[ErrorModel class]]) {
			completion(object);
		} else {
			CategoriesModel *categories = [[CategoriesModel alloc] initWithDictionary:@{@"categories": object} error:nil];
			completion(categories);
		}
	}];
}

@end
