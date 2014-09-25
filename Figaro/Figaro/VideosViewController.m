//
//  VideosViewController.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "VideosViewController.h"
#import "CategoriesModel+Manager.h"
#import "VideoHeadersModel+Manager.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideosViewController ()

@property (nonatomic, strong) CategoryModel *selectedCategory;
@property (nonatomic, strong) SubcategoryModel *selectedSubcategory;

@end

@implementation VideosViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self configure];
}

- (void)configure {
	__weak __typeof(self)weakSelf = self;
	
	self.categoriesCollectionView.backgroundColor = [UIColor color];
	self.categoriesCollectionView.textColor = [UIColor whiteColor];
	
	self.subcategoriesCollectionView.backgroundColor = [UIColor whiteColor];
	self.subcategoriesCollectionView.textColor = [UIColor color];
	
	[CategoriesModel get:^(id object) {
		if ([object isKindOfClass:[CategoriesModel class]]) {
			CategoriesModel *categories = object;
			
			DLog(@"categories: %@", categories);
			self.categoriesCollectionView.categories = categories;
			CategoryModel *firstCategory = [categories.categories firstObject];
			self.selectedCategory = firstCategory;
			self.subcategoriesCollectionView.list = firstCategory.subcategories;
			SubcategoryModel *firstSubcategory = [firstCategory.subcategories firstObject];
			[self loadVideosWithSubcategoryModel:firstSubcategory];
		} else {
			DLog(@"object: %@", object);
		}
	}];
	
	// Categories
	self.categoriesCollectionView.didSelectCategoryCompletion = ^(id object) {
		if ([object isKindOfClass:[CategoryModel class]]) {
			CategoryModel *category = object;
			if ([category isEqual:weakSelf.selectedCategory] && weakSelf.selectedCategory != nil) {
				//INFO: category already selected
			} else {
				weakSelf.subcategoriesCollectionView.list = category.subcategories;
				SubcategoryModel *firstSubcategory = [category.subcategories firstObject];
				[weakSelf.subcategoriesCollectionView selectItem:firstSubcategory];
				[weakSelf loadVideosWithSubcategoryModel:firstSubcategory];
			}
			weakSelf.selectedCategory = category;
		}
	};
	
	// Subcategories
	self.subcategoriesCollectionView.didSelectSubcategoryCompletion = ^(id object) {
		if ([object isKindOfClass:[SubcategoryModel class]]) {
			[weakSelf loadVideosWithSubcategoryModel:object];
		}
	};
	
	// Videos
	self.videosTableView.didSelectItemCompletion = ^(id object) {
		if ([object isKindOfClass:[VideoHeaderModel class]]) {
			VideoHeaderModel *video = object;
			
			DLog(@"video: %@", video);
			[weakSelf playMovie:video.videoUrl];
		}
	};
	
}

- (void)loadVideosWithSubcategoryModel:(SubcategoryModel *)subcategory {
	if ([self.selectedSubcategory.id isEqualToString:subcategory.id] && subcategory != nil) {
		//INFO: Subcategory already selected
	} else {
		self.videosTableView.list = nil;
		[VideoHeadersModel getWithId:subcategory.id completion:^(id object) {
			DLog(@"object: %@", object);
			if ([object isKindOfClass:[VideoHeadersModel class]]) {
				self.videosTableView.videos = object;
			}
		}];
	}
	
	self.selectedSubcategory = subcategory;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	
//	dispatch_async( dispatch_get_main_queue(), ^{
		UICollectionViewLayout *categoryLayout = self.categoriesCollectionView.collectionViewLayout;
		[categoryLayout invalidateLayout];
		[self.categoriesCollectionView reloadData];
		
		UICollectionViewLayout *subcategoryLayout = self.subcategoriesCollectionView.collectionViewLayout;
		[subcategoryLayout invalidateLayout];
		
		[self.subcategoriesCollectionView reloadData];
		
//		[self.videosTableView reloadData];
//	});
}

#pragma mark - Moovie

- (void)playMovie:(NSURL *)url {
	if (url == nil)
		return;
	
	MPMoviePlayerViewController *moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
	
	[self presentViewController:moviePlayerViewController animated:YES completion:nil];
}

@end
