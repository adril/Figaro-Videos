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

#define IMAGE_OFFSET_SPEED 12
static NSString *VideoTableViewCellIdentifier = @"VideoTableViewCell";

@implementation VideosTableView

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self configure];
}

- (void)configure {
	[super configure];
	
	[self registerNibWithIdentifier:VideoTableViewCellIdentifier];
	self.rowHeight = 211.0;
	__weak __typeof(self)weakSelf = self;
	
	self.didSelectItemCompletion = ^(id object) {
		//TODO: call completion block
	};
	
	self.cellForRowAtIndexPathCompletion = ^(id object, UITableViewCell **cell, NSIndexPath *indexPath) {
		
		if ([object isKindOfClass:[VideoHeaderModel class]]) {
			*cell = [weakSelf dequeueReusableCellWithIdentifier:VideoTableViewCellIdentifier];
			
			VideoTableViewCell *videoCell = (VideoTableViewCell *)*cell;
//			[weakSelf updateImageViewCellOffset:videoCell];
			videoCell.video = object;
		}
	};
}

- (void)setVideos:(VideoHeadersModel *)videos {
	_videos = videos;
	if (videos) {
		self.list = videos.videoHeaders;
	}
}

#pragma mark - UIScrollViewdelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	for (VideoTableViewCell *cell in self.visibleCells) {
//		[self updateImageViewCellOffset:cell];
	}
}

- (void)updateImageViewCellOffset:(VideoTableViewCell *)cell {
	
	if (YES) {
		CGFloat imageOverflowHeight = [cell imageOverflowHeight];
		
		CGFloat cellOffset = cell.frame.origin.y - self.contentOffset.y;
		CGFloat maxOffset = self.frame.size.height - cell.frame.size.height;
		CGFloat verticalOffset = imageOverflowHeight * (0.5f - cellOffset/maxOffset);
		
		cell.imageOffset = CGPointMake(0.0f, verticalOffset);
	}
//	else if (YES) {
//		CGFloat yOffset = ((self.contentOffset.y - self.frame.origin.y) / cell.frame.size.height) * IMAGE_OFFSET_SPEED;
//		cell.imageOffset = CGPointMake(0.0f, yOffset);
//
//	}
}

@end
