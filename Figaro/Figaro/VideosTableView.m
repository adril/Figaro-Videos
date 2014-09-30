//
//  VideosTableView.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "VideosTableView.h"
#import "VideoHeaderModel.h"
#import "VideoTableViewCell.h"

static NSString *VideoTableViewCellIdentifier = @"VideoTableViewCell";

@implementation VideosTableView

- (void)configure {
	[super configure];
	
	[self registerNibWithIdentifier:VideoTableViewCellIdentifier];
	self.rowHeight = 211.0;
	__weak __typeof(self)weakSelf = self;
	
	self.didSelectItemCompletion = ^(id object) {
		//TODO: call completion block
	};
	
	self.cellForRowAtIndexPathCompletion = ^(id object, UITableViewCell *cell, NSIndexPath *indexPath) {
		
		if ([object isKindOfClass:[VideoHeaderModel class]]) {
			cell = [weakSelf dequeueReusableCellWithIdentifier:VideoTableViewCellIdentifier];
			
			VideoTableViewCell *videoCell = (VideoTableViewCell *)cell;
			videoCell.video = object;
		}
		return cell;
	};
}

- (void)setVideos:(VideoHeadersModel *)videos {
	_videos = videos;
	if (videos) {
		self.list = videos.videoHeaders;
	}
}

@end
