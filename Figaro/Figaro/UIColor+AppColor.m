//
//  UIColor+AppColor.m
//  Figaro
//
//  Created by Adrien Guffens on 25/09/14.
//
//

#import "UIColor+AppColor.h"
#import "AppParameters.h"

@implementation UIColor (AppColor)

//INFO: 

+ (UIColor *)color {
	NSString *hexColor = [AppParameters defaultParameters].parameters.color == nil ? @"#407cc9" : [AppParameters defaultParameters].parameters.color;
	return [UIColor colorFromHexString:hexColor];
}

+ (UIColor *)titleColor {
	NSString *hexColor = [AppParameters defaultParameters].parameters.titleColor == nil ? @"#000000" : [AppParameters defaultParameters].parameters.titleColor;
	return [UIColor colorFromHexString:hexColor];
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
