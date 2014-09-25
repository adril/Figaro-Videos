//
//  BaseJsonModel.m
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"
#import "Base.h"

@implementation BaseJsonModel

- (id)init {
	self = [super init];
	return self;
}

+ (BOOL)propertyIsOptional:(NSString*)propertyName {
	return YES;
}

//+ (JSONKeyMapper*)keyMapper {
//	return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
//}

@end
