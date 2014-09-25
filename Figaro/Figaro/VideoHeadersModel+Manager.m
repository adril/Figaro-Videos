//
//  VideoHeadersModel+Manager.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "VideoHeadersModel+Manager.h"
#import "NSDictionary+ClientAPI.h"
#import "ErrorModel.h"

@implementation VideoHeadersModel (Manager)

+ (void)getWithId:(NSString *)identifier completion:(BaseCompletionHandler)completion {
	NSString *route = [NSString stringWithFormat:@"/video/header/%@", identifier];
	[@{} getWithRoute:route completion:^(id object) {
		DLog(@"object: %@", object);
		if (object == nil || [object isKindOfClass:[ErrorModel class]]) {
			completion(object);
		} else {
			VideoHeadersModel *videoHeaders = [[VideoHeadersModel alloc] initWithDictionary:@{@"videoHeaders": object} error:nil];
			completion(videoHeaders);
		}
	}];
}

@end
