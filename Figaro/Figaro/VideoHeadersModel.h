//
//  VideoHeadersModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"
#import "VideoHeaderModel.h"

@protocol VideoHeadersModel
@end

@interface VideoHeadersModel : BaseJsonModel

@property (nonatomic, strong) NSMutableArray<VideoHeaderModel> *videoHeaders;

@end
