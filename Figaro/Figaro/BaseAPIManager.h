//
//  AWAAPIManager.h
//  AWA
//
//  Created by Adrien Guffens on 21/11/13.
//  Copyright (c) 2013 Team3000. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperationManager.h>

typedef void (^CompletionBaseAPIManager)(id object);

@interface BaseAPIManager : AFHTTPRequestOperationManager

+ (BaseAPIManager *)defaultAPI;
- (id)initWithBaseURLString:(NSString *)url;

- (void)cancelAllOperations;
- (void)cancelAllOperationsWithMethod:(NSString *)path;

@end
