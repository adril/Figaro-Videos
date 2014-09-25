//
//  VideoHeadersModel+Manager.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "VideoHeadersModel.h"
#import "Base.h"

@interface VideoHeadersModel (Manager)

+ (void)getWithId:(NSString *)identifier completion:(BaseCompletionHandler)completion;

@end
