//
//  VideoTableViewCell.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "VideoTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import "BaseLabel.h"

@interface VideoTableViewCell ()

@property (strong, nonatomic) IBOutlet BaseLabel *titleLabel;
@property (strong, nonatomic) IBOutlet BaseLabel *contentLabel;


@end

@implementation VideoTableViewCell

- (void)awakeFromNib {
	// Initialization code
	[super awakeFromNib];
	
	[self configure];
}

- (void)configure {
	self.informationView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
	self.titleLabel.font = [UIFont titleFont];
	self.titleLabel.textColor = [UIColor color];
	self.contentLabel.font = [UIFont font];
	self.contentLabel.textColor = [UIColor fontColor];
}

- (void)setVideo:(VideoHeaderModel *)video {
	_video = video;
	[self reset];
	if (video) {
		self.titleLabel.text = video.title;
		self.contentLabel.text = video.content;
		
		__weak __typeof(self)weakSelf = self;
		[self.videoImageView setImageWithURLRequest:[NSURLRequest requestWithURL:video.img] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
			
			[weakSelf layoutIfNeeded];
			[UIView animateWithDuration:0.4 animations:^{
				weakSelf.videoImageView.image = image;
				weakSelf.videoImageView.alpha = 1.0;
				[weakSelf layoutIfNeeded];
			}];
		} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
			
		}];
	}
}

- (void)reset {
	self.titleLabel.text = @"";
	self.contentLabel.text = @"";
	self.videoImageView.alpha = 0.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	
	// Configure the view for the selected state
}

@end
