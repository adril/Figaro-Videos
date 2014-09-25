//
//  VideoTableViewCell.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <UIKit/UIKit.h>
#import "VideoHeaderModel.h"
#import "BaseImageView.h"

@interface VideoTableViewCell : UITableViewCell

@property(nonatomic, strong) VideoHeaderModel *video;
@property (strong, nonatomic) IBOutlet UIView *informationView;
@property (strong, nonatomic) IBOutlet BaseImageView *videoImageView;

- (void)reset;

@end
