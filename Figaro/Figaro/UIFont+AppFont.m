//
//  UIFont+AppFont.m
//  Figaro
//
//  Created by Adrien Guffens on 25/09/14.
//
//

#import "UIFont+AppFont.h"

@implementation UIFont (AppFont)

+ (UIFont *)font {
	return [UIFont fontWithName:@"DroidSans" size:13.0];
}

+ (UIFont *)mediumFont {
	return [UIFont fontWithName:@"MuseoSlab-500" size:17.0];
}

+ (UIFont *)bigFont {
	return [UIFont fontWithName:@"MuseoSlab-500" size:22.0];
}

+ (UIFont *)selectedFont {
	return [UIFont fontWithName:@"MuseoSlab-500" size:15];
}

+ (UIFont *)smallFont {
	return [UIFont fontWithName:@"MuseoSlab-500" size:11];
}

+ (UIFont *)titleFont {
	return [UIFont fontWithName:@"MuseoSlab-500" size:20.0];
}

+ (UIFont *)subtitleFont {
	return [UIFont fontWithName:@"DroidSans" size:16.0];
}


@end
