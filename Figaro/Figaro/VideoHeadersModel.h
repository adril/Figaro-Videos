//
//  VideoHeadersModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"
#import "VideoHeaderModel.h"

@interface VideoHeadersModel : BaseJsonModel

@property (nonatomic, strong) NSMutableArray<VideoHeaderModel> *videoHeaders;

@end
