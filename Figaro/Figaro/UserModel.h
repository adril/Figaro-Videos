//
//  UserModel.h
//  Figaro
//
//  Created by Adrien Guffens on 24/09/14.
//
//

#import "BaseJsonModel.h"

@protocol UserModel
@end

@interface UserModel : BaseJsonModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *authToken;

@end
