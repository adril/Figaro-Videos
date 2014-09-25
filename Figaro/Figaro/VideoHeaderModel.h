//
//  VideoHeaderModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"

@protocol VideoHeaderModel
@end

@interface VideoHeaderModel : BaseJsonModel

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *update;
@property (nonatomic, strong) NSNumber *duration;
@property (nonatomic, strong) NSURL *img;
@property (nonatomic, strong) NSURL *videoUrl;

@end
