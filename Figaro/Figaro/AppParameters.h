//
//  AppParameters.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import <Foundation/Foundation.h>
#import "ParametersModel.h"
#import "EnvironementModel.h"

@interface AppParameters : NSObject

+ (AppParameters *)defaultParameters;

@property (nonatomic, strong) ParametersModel *parameters;
@property (nonatomic, strong) EnvironementModel *environememnt;

@end
