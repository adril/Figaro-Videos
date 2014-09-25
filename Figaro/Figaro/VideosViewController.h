//
//  VideosViewController.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseViewController.h"
#import "VideoHeadersModel.h"
#import "CategoriesCollectionView.h"
#import "VideosTableView.h"

@interface VideosViewController : BaseViewController

@property (strong, nonatomic) IBOutlet CategoriesCollectionView *categoriesCollectionView;
@property (strong, nonatomic) IBOutlet CategoriesCollectionView *subcategoriesCollectionView;
@property (strong, nonatomic) IBOutlet VideosTableView *videosTableView;

@end
