//
//  VideosTableView.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseTableView.h"
#import "VideoHeadersModel.h"

@interface VideosTableView : BaseTableView

@property (nonatomic, strong) VideoHeadersModel *videos;

@end
