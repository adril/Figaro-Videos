//
//  EnvironementModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"

@protocol EnvironementModel

@end

@interface EnvironementModel : BaseJsonModel

@property (nonatomic, strong) NSString *api;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *port;

@end
