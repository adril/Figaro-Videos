//
//  UIColor+AppColor.m
//  Figaro
//
//  Created by Adrien Guffens on 25/09/14.
//
//

#import "UIColor+AppColor.h"

@implementation UIColor (AppColor)

//INFO: 

+ (UIColor *)color {
	return [UIColor colorFromHexString:@"#407cc9"];
}

+ (UIColor *)titleColor {
	return [UIColor whiteColor];
}

+ (UIColor *)fontColor {
	return [UIColor colorFromHexString:@"#333"];
}

+ (UIColor *)selectedFontColor {
	return [UIColor colorFromHexString:@"#E0E0E0"];
}

+ (UIColor *)borderColor {
	return [UIColor colorFromHexString:@"#DFDFDF"];
}

+ (UIColor *)backgroundCellColor {
	return [UIColor colorFromHexString:@"#F9F9F9"];
}

+ (UIColor *)backgroundColor {
	return [UIColor whiteColor];
}

+ (UIColor *)selectedBackgroundColor {
	return [UIColor colorFromHexString:@"#E0E0E0"];
}

@end
