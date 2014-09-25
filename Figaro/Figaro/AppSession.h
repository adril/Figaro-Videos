//
//  AppSession.h
//  unknown
//
//  Created by Adrien Guffens on 29/05/14.
//  Copyright (c) 2014 ABDI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface AppSession : NSObject {
	UserModel *_currentUser;
}

+ (AppSession *)defaultSession;
- (void)closeAndClearSession;

@property (nonatomic, strong) UserModel *currentUser;

@end

