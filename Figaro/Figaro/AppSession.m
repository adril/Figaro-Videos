//
//  AppSession.m
//  unknown
//
//  Created by Adrien Guffens on 29/05/14.
//  Copyright (c) 2014 ABDI. All rights reserved.
//

#import "AppSession.h"

@implementation AppSession

+ (AppSession *)defaultSession {
    static AppSession *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });
    
    return _sharedClient;
}

- (void)closeAndClearSession {
	
	_currentUser = nil;
	
	//TODO: close and clear session
	
//	[FBSession.activeSession closeAndClearTokenInformation];
//	[[AppDelegate appDelegate].apiManager cancelAllOperations];
}

@end
