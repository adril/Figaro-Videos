//
//  AWAAPIManager.m
//  AWA
//
//  Created by Adrien Guffens on 21/11/13.
//  Copyright (c) 2013 Team3000. All rights reserved.
//

#import "BaseAPIManager.h"

#import "AppSession.h"

#import "UserModel.h"
#import "AppParameters.h"
#import "EnvironementModel.h"

@implementation BaseAPIManager


+ (BaseAPIManager *)defaultAPI {
    static BaseAPIManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });
    
    return _sharedClient;
}

- (id)init {
	EnvironementModel *environement = [AppParameters defaultParameters].environememnt;
	
	NSString *url = environement.api;
	if (url == nil || [url length] == 0) {
		DLog(@"[ERROR] Bad url");
		return nil;
	}
	NSURL *baseURL = [NSURL URLWithString:url];
	self = [super initWithBaseURL:baseURL];
	if (self) {
		[self networkReachabilityHandler];
	}
	return self;
}

- (id)initWithBaseURLString:(NSString *)url {
	NSURL *baseURL = [NSURL URLWithString:url];
	self = [super initWithBaseURL:baseURL];
	if (self) {
		[self networkReachabilityHandler];
	}
	return self;
}

- (void)networkReachabilityHandler {
	NSOperationQueue *operationQueue = self.operationQueue;
	
	[self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
		switch (status) {
			case AFNetworkReachabilityStatusReachableViaWWAN:
			case AFNetworkReachabilityStatusReachableViaWiFi:
				[operationQueue setSuspended:NO];
				break;
			case AFNetworkReachabilityStatusNotReachable:
			default:
				[operationQueue setSuspended:YES];
				break;
		}
	}];
}

- (AFHTTPRequestOperation *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
		
	AFHTTPRequestOperation *request = [super POST:URLString parameters:parameters success:success failure:failure];

	return request;
}

- (AFHTTPRequestOperation *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
	AFHTTPRequestOperation *request = [super GET:URLString parameters:parameters success:success failure:failure];
	
	DLog(@"request: %@", request);
	return request;
}

- (void)cancelAllOperations {
	[self.operationQueue cancelAllOperations];
}

- (void)cancelAllOperationsWithMethod:(NSString *)path {
	//TODO: to finish
	for (id object in self.operationQueue.operations) {
		DLog(@"object: %@", object);
		//--> to finish
	}
}

@end
