//
//  ParametersModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"

@interface ParametersModel : BaseJsonModel

@property (strong, nonatomic) NSNumber *id;
@property (strong, nonatomic) NSString *appName;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *titleColor;
@property (strong, nonatomic) NSString *tintColor;
@property (strong, nonatomic) NSString *backgroundColor;
@property (strong, nonatomic) NSString *defaultDateFormat;
@property (strong, nonatomic) NSDictionary *environements;

@end
